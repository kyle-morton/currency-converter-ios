//
//  PreferenceStore.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import Foundation

class FavoritesStore : ObservableObject {
    @Published var favorites: [String] = [];
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("favorites.data");
    };
    
    /// wrapper async function for the legacy DispatchQueue version
    static func load() async throws -> [String] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error);
                case .success(let scrums):
                    continuation.resume(returning: scrums);
                }
                
            }
        }
    }
    
    static func load(completion: @escaping (Result<[String], Error>)->Void) {
        
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL();
                
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]));
                    }
                    return;
                }
                
                
                let favorites = try JSONDecoder().decode([String].self, from: file.availableData);
                DispatchQueue.main.async {
                    completion(.success(favorites));
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error));
                }
            }
        }
    }
    
    /// discardable result -> disables compiler warnings if client doesn't store FNs return value
    @discardableResult
    static func save(favorites: [String]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(favorites:favorites) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error);
                case .success(let scrums):
                    continuation.resume(returning: scrums);
                }
                
            }
        }
    }
    
    static func save(favorites: [String], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(favorites);
                let outfile = try fileURL();
                try data.write(to: outfile);
                DispatchQueue.main.async {
                    completion(.success(favorites.count));
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error));
                }
            }
        };
    }
    
}

extension FavoritesStore {
    static let sampleData = [
        "USD"
    ];
}
