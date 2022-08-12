//
//  ConversionResponse.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/11/22.
//

import Foundation

struct ConversionResponse : Codable {
    var result: String;
    var time_last_update_unix: String;
    var base_code: String;
    var target_code: String;
    var conversion_rate: Decimal;
    var conversion_result: Decimal;
}
