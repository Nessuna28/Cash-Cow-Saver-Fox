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
    var firstName: String
    var image: String?
    var birthday: Date?
    var domicile: String?
    var children: Int?
    var childrenAccounts: [FireChild]?
    var registeredAt: Date
}
