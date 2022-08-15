//
//  CurrencyListView.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import SwiftUI

struct CurrencyListView: View {
    
    @Binding var favorites: [String];
    @Binding var conversions: [Conversion];
    let saveAction: ()->Void;
    
    func isFavorite(id: String) -> Bool {
        return favorites.contains(id);
    }
    
    func toggleFavorite(id: String) {
        if (isFavorite(id: id)) {
            favorites = favorites.filter { $0 != id};
        } else {
            favorites.append(id);
        }
        
        saveAction();
    }
        
    var body: some View {
        VStack {
            List {
                ForEach(CurrencyType.data) { type in
                    NavigationLink(destination: CurrencyDetailView(
                        currencyType: .constant(type),
                        favorites: $favorites,
                        usdConversionRate: 0
                    ))
                    {
                        HStack {
                            Image(systemName: self.isFavorite(id: type.id) ? "heart.fill" : "heart")
                                .onTapGesture { self.toggleFavorite(id: type.id) }
                            Text(type.description)
//                                .font(.headline);

                        }

                    }
                    
                }
            }
        }
        .navigationTitle("Currency Types")
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView(
            favorites: .constant(["AED"]),
            conversions: .constant([]),
            saveAction: {}
        )
    }
}
