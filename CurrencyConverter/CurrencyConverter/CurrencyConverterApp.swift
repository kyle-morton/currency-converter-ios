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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CurrencyListView(
                    favorites: $favoritesStore.favorites,
                    conversions: $conversionStore.conversions
                );
            }
        }
    }
}
