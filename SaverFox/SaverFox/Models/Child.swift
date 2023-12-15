//
//  Child.swift
//  SaverFox
//
//  Created by Angelique Freier on 07.12.23.
//

import Foundation

struct Child: Codable, Identifiable {
    
    var id: String
    
    var lastName: String
    var firstName: String
    var birthday: Date
    
    var loginName: String
    var loginImage: String
}
