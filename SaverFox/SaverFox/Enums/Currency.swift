//
//  Currency.swift
//  SaverFox
//
//  Created by Angelique Freier on 19.12.23.
//

import Foundation

enum Currency: String, Identifiable, CaseIterable {
    case euro, zloty, dollar
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .euro: return Strings.euro
        case .zloty: return Strings.zloty
        case .dollar: return Strings.dollar
        }
    }
    
    var code: String {
        switch self {
        case .euro: return "EUR"
        case .zloty: return "PLN"
        case .dollar: return "USD"
        }
    }
}
