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
    @State var valueInUSD: Decimal;
    
    var body: some View {
        List {
            Section(header: Text("Current Value (USD)")) {
                HStack {
                    Label("", systemImage: "dollarsign.circle");
                    Spacer();
                    Text("\(String(describing: valueInUSD))");
                }
                .accessibilityLabel("Current USD");
            }
        }
        .padding()
        .navigationTitle("\(currencyType.description) (\(currencyType.id))")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                let result = try await Network().getLatestRates(currencyCode: currencyType.id);
                valueInUSD = result.conversion_rates.USD;
            } catch {
                print("Error", error)
            }
        }
    }
}

struct CurrencyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDetailView(
            currencyType: .constant(CurrencyType.data[0]),
            favorites: .constant(FavoritesStore.sampleData),
            valueInUSD: 1.25
        );
    }
}
