//
//  ChildAccount.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import Foundation

struct ChildAccount: Codable {
    
    let childId: String
    let lastName: String?
    let firstName: String
    let birthday: Date?
    
    let loginName: String
    let loginImage: String
}
