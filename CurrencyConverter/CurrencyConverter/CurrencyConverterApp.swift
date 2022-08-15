//
//  CurrencyConverterApp.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import SwiftUI

@main
struct CurrencyConverterApp: App {
    @StateObject private var favoritesStore = FavoritesStore();
    @StateObject private var conversionStore = ConversionStore();
    
    @State private var errorWrapper: ErrorWrapper?;
    
    enum TestError: Error {
            case errorRequired
        }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CurrencyListView(
                    favorites: $favoritesStore.favorites,
                    conversions: $conversionStore.conversions)
                {
                    Task {
                        do {
                            try await FavoritesStore.save(favorites: favoritesStore.favorites);
                        }
                        catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.");
                        }
                    }

                }
            }
            .task {
                do {
                    favoritesStore.favorites = try await FavoritesStore.load();
                }
                catch {
                }
            }
        }
    }
}
