//
//  Settings.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct Settings: Codable, Identifiable {
    @DocumentID var id: String?
    
    let childId: String
    var backgroundColor: String
    var textColor: String
    var userFontSize: String
    var isDarkModeEnabled: Bool
    
}
