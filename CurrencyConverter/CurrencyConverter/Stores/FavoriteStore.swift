//
//  PreferenceStore.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import Foundation

class FavoritesStore : ObservableObject {
    @Published var favorites: [String] = [];
    
    
}

extension FavoritesStore {
    static let sampleData = [
        "USD"
    ];
}
