//
//  FireChoiceOption.swift
//  CashCow
//
//  Created by Angelique Freier on 10.01.24.
//

import Foundation
import FirebaseFirestore

struct FireChoiceOption: Identifiable, Codable {
    @DocumentID var id: String?
    
    var title: String
    var icon: String
    var isEnabled: Bool
}
