//
//  SavingsGoal.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import Foundation
import FirebaseFirestore

struct SavingsGoal: Codable, Identifiable {
    @DocumentID var id: String?
    
    let childId: String
    var date: Date
    var icon: String
    var title: String
    var sumOfMoney: Double
}
