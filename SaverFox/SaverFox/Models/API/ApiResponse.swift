//
//  ApiResponse.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation

struct ApiResponse: Codable {
    
    var success: Bool
    var query: CurrencyConverter
    var result: Double
}
