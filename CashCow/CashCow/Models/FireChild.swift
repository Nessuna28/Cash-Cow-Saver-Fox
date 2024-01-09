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
    
    let parentId: String
    var familyMember: String
    var lastName: String?
    var firstName: String
    var birthday: Date?
    
    var loginName: String
    var loginImage: String
    
    var registeredAt: Date
    
    var initialAmount: Double?
    var currentPoints: Int?
    var rewardClaimDate: Date?
    var inquiry: Int?
}
