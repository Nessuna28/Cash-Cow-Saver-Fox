//
//  CurrencyConverter.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation

struct CurrencyConverter: Codable {
    
    // swiftlint:disable identifier_name
    var from: String
    var to: String
    var amount: Int
}
