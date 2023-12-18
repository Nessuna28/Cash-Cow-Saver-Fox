//
//  CurrencyConverterRepository.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation

class CurrencyConverterRepository {
    
    static func fetchData() async throws -> [CurrencyConverter] {
        guard let url = URL(string: "https://api.currencyapi.com/v3/convert?value=12") else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([CurrencyConverter].self, from:  data)
    }
}
