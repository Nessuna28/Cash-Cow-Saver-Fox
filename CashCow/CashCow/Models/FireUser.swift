//
//  FireUser.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import Foundation

struct FireUser: Codable {
    
    let id: String
    let lastName: String?
    let firstName: String
    let birthday: Date?
    let domicile: String?
    let children: Int?
    let familyAccounts: [ChildAccount]?
    let registeredAt: Date
}
