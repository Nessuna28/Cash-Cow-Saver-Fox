//
//  FireUser.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import Foundation

struct FireUser: Codable, Identifiable {
    
    let id: String
    let email: String
    var lastName: String?
    let firstName: String
    var birthday: Date?
    var domicile: String?
    var children: Int?
    var familyAccounts: [FireChild]?
    var registeredAt: Date
}
