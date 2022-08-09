//
//  CurrencyListView.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import SwiftUI

struct CurrencyListView: View {
    
    var currencyTypes = CurrencyType.data;
    
    var body: some View {
        VStack {
            Section("Currency Types") {
                List {
                    ForEach(currencyTypes) { type in
                        Text(type.description)
                            .font(.headline);
                    }
                }
            }
        }
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView()
    }
}
