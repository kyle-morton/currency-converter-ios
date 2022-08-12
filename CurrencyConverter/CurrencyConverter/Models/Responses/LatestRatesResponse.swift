//
//  ConversionResponse.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/8/22.
//

import Foundation

struct LatestRatesResponse : Codable {
    var result: String;
    var documentation: String;
    var terms_of_use: String;
    var conversion_rates: ConversionRate;
}

struct ConversionRate: Codable {
    var AED: Decimal;
    var ARS: Decimal;
    var AUD: Decimal;
    var BGN: Decimal;
    var BRL: Decimal;
    var BSD: Decimal;
    var CAD: Decimal;
    var CHF: Decimal;
    var CLP: Decimal;
    var CNY: Decimal;
    var COP: Decimal;
    var CZK: Decimal;
    var DKK: Decimal;
    var DOP: Decimal;
    var EGP: Decimal;
    var EUR: Decimal;
    var FJD: Decimal;
    var GBP: Decimal;
    var GTQ: Decimal;
    var HKD: Decimal;
    var HRK: Decimal;
    var HUF: Decimal;
    var IDR: Decimal;
    var ILS: Decimal;
    var INR: Decimal;
    var ISK: Decimal;
    var JPY: Decimal;
    var KRW: Decimal;
    var KZT: Decimal;
    var MXN: Decimal;
    var MYR: Decimal;
    var NOK: Decimal;
    var NZD: Decimal;
    var PAB: Decimal;
    var PEN: Decimal;
    var PHP: Decimal;
    var PKR: Decimal;
    var PLN: Decimal;
    var PYG: Decimal;
    var RON: Decimal;
    var RUB: Decimal;
    var SAR: Decimal;
    var SEK: Decimal;
    var SGD: Decimal;
    var THB: Decimal;
    var TRY: Decimal;
    var TWD: Decimal;
    var UAH: Decimal;
    var USD: Decimal;
    var UYU: Decimal;
    var ZAR: Decimal;
}
