//
//  CurrencyDetailView.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import SwiftUI

struct CurrencyDetailView: View {
    @Binding var currencyType: CurrencyType;
    @Binding var favorites: [String];
    
    var body: some View {
        List {
            Section("Current Value") {
                // Pull current value from API
            }
            VStack {
                Button(action: {}) {
                    Image(systemName: "heart");
                    Image(systemName: "heart.fill");
                }
            }
        }
        .padding()
        .navigationTitle(currencyType.description)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CurrencyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDetailView(
            currencyType: .constant(CurrencyType.data[0]),
            favorites: .constant(FavoritesStore.sampleData)
        );
    }
}
