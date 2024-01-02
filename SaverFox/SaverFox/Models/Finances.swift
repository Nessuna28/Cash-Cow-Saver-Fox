//
//  Finances.swift
//  SaverFox
//
//  Created by Angelique Freier on 02.01.24.
//

import Foundation
import FirebaseFirestore

struct Finances: Codable, Identifiable {
    @DocumentID var id: String?
    
    var initialAmount: Double
    var currentPoints: Int
    
    var revenue: [Finance]
    var expenditure: [Finance]
    var savingsGoals: [SavingsGoal]
}
