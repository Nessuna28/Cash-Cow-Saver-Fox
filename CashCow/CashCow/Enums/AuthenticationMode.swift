//
//  AuthenticationMode.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import Foundation

enum AuthenticationMode {
    case login, register
    
    
    var title: String {
        switch self {
        case .login: return "Anmelden"
        case .register: return "Registrieren"
        }
    }
}
