//
//  FireSettingUser.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct FireSettings: Codable, Identifiable {
    @DocumentID var id: String?
    
    let userId: String
    var backgroundColor: String
    var textColor: String
    var userFontSize: String
    var isDarkModeEnabled: Bool
}
