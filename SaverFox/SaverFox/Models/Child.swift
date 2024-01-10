//
//  Child.swift
//  SaverFox
//
//  Created by Angelique Freier on 07.12.23.
//

import Foundation
import FirebaseFirestoreSwift

struct Child: Codable, Identifiable {
    @DocumentID var id: String?
    
    var familyMember: String
    var lastName: String?
    var firstName: String
    var birthday: Date?
    var profilePicture: String?
    
    var loginName: String
    var loginImage: String
    
    var initialAmount: Double?
    var currentPoints: Int?
    var rewardClaimDate: Date?
    var inquiry: Int?
    
}
