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
    @State var usdConversionRate: Decimal;
    
    var body: some View {
        List {
            Section(header: Text("Conversion Rate (USD)")) {
                HStack {
                    Label("", systemImage: "dollarsign.circle");
                    Spacer();
                    Text("\(String(describing: usdConversionRate))");
                }
                .accessibilityLabel("USD Conversion Rate");
            }
        }
        .padding()
        .navigationTitle("\(currencyType.description) (\(currencyType.id))")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                let result = try await ConversionClient().getConversionRate(originCurrencyCode: currencyType.id, destinationCurrencyCode: "USD");
                usdConversionRate = result.conversion_rate;
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
            usdConversionRate: 0.45
        );
    }
}
