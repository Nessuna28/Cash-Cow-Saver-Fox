//
//  Currency.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation

struct Currency: Codable {
    
    var EUR: EUR
    var PLN: PLN
    var RUB: RUB
    var CNY: CNY
    var JPY: JPY
    var CHF: CHF
}



// Euro
struct EUR: Codable {
    
    var code: String
    var value: Double
}

// Polish Zloty
struct PLN: Codable {
    
    var code: String
    var value: Double
}

// Russian Ruble
struct RUB: Codable {
    
    var code: String
    var value: Double
}

// Chinese Yuan
struct CNY: Codable {
    
    var code: String
    var value: Double
}

// Japanese Yen
struct JPY: Codable {
    
    var code: String
    var value: Double
}

// Swiss Franc
struct CHF: Codable {
    
    var code: String
    var value: Double
}
