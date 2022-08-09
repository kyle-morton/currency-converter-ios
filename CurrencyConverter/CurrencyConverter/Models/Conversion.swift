//
//  ConversionRequest.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import Foundation

struct Conversion : Identifiable, Codable {
    
    var id: UUID;
    var originCurrency: String;
    var destinationCurrency: String;
    var amount: Decimal;
    var convertedAmount: Decimal;
    
}
