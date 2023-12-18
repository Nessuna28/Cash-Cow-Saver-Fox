//
//  CurrencyConverter.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation

struct CurrencyConverter: Codable {
    
    var meta: [LastUpdate]
    var data: [Currency]
}
