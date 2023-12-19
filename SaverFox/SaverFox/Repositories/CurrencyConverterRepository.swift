//
//  CurrencyConverterRepository.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation

class CurrencyConverterRepository {
    
    private static var apiKey = "e0cf46a0cdmsh1d32c337e66c00ep1ae79ajsne3f27873ba4d"
    
    static func fetchData(fromCurrency: String, toCurrency: String, amount: Int) async throws -> ApiResponse {
        
        let headers = [
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": "currency-conversion-and-exchange-rates.p.rapidapi.com"
        ]
        
        guard let url = URL(string: "https://currency-conversion-and-exchange-rates.p.rapidapi.com/convert?from=\(fromCurrency)&to=\(toCurrency)&amount=\(amount)") else {
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(ApiResponse.self, from: data)
    }
}
