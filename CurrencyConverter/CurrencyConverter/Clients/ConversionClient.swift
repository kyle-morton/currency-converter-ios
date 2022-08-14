//
//  Network.swift
//  CurrencyConverter
//
//  Created by Kyle Morton on 8/10/22.
//

import SwiftUI

class ConversionClient {

    func getLatestRates(currencyCode: String) async throws -> LatestRatesResponse {
        guard let url = URL(string:"https://v6.exchangerate-api.com/v6/c59dbd082e2ef4e3179ff9b1/latest/\(currencyCode)")
            else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url);
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest);
    
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while fetching rates"); }
        
//        print("response: \(data)");
        
        let decodedRates = try JSONDecoder().decode(LatestRatesResponse.self, from: data);
//        print("Async DecodedRates", decodedRates);
        
        return decodedRates;
    }
    
    func getConversionRate(
        originCurrencyCode: String,
        destinationCurrencyCode: String) async throws -> ConversionResponse {
        guard let url = URL(string: "https://v6.exchangerate-api.com/v6/c59dbd082e2ef4e3179ff9b1/pair/\(originCurrencyCode)/\(destinationCurrencyCode)")
        else { fatalError("Missing URL")};
        
        let urlRequest = URLRequest(url: url);
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest);
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while fetching rates"); }
        
        print("response: \(data)");
        
        let decodedRate = try JSONDecoder().decode(ConversionResponse.self, from: data);
        
        print("Async DecodedRate", decodedRate);
        
        return decodedRate;
    }
}
