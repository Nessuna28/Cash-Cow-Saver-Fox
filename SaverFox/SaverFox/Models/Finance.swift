//
//  Finance.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import FirebaseFirestore

struct Finance: Codable, Identifiable {
    @DocumentID var id: String?
    
    var date: Date
    var category: String
    var icon: String
    var fromOrFor: String
    var title: String
    var sumOfMoney: Double
}
