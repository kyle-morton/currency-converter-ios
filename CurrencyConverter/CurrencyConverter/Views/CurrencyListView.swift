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
        
    var body: some View {
        VStack {
            List {
                ForEach(CurrencyType.data) { type in
                    NavigationLink(destination: CurrencyDetailView(
                        currencyType: .constant(type),
                        favorites: $favorites,
                        valueInUSD: 0
                    ))
                    {
                        HStack {
                            Text(type.description)
                                .font(.headline);
//                            Button(action: {}) {
//                                Image(systemName: "heart.empty")
//                            }
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
            favorites: .constant(["USD"]),
            conversions: .constant([])
        )
    }
}
