//
//  FireChild.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import Foundation
import FirebaseFirestoreSwift

struct FireChild: Codable, Identifiable {
    @DocumentID var id: String?
    
    let childId: String
    var lastName: String?
    let firstName: String
    var birthday: Date?
    
    let loginName: String
    let loginImage: String
}
