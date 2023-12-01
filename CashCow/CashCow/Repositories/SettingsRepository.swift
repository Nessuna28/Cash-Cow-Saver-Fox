//
//  SettingsRepository.swift
//  CashCow
//
//  Created by Angelique Freier on 01.12.23.
//

import Foundation
import UIKit

class SettingsRepository {
    
    static func createSettings(with id: String, settings: FireSettings) {
        
        let settings = FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: settings.backgroundColor, textColor: settings.textColor, userFontSize: settings.userFontSize, isDarkModeEnabled: settings.isDarkModeEnabled)
        
        do {
            try AuthManager.shared.database.collection("settings").addDocument(from: settings)
        } catch {
            print("Saving settings failed:", error)
        }
    }
    
    
    static func updateSettings(with id: String, settings: FireSettings) {
        
        let data = ["backgroundColor": settings.backgroundColor, "textColor": settings.textColor, "userFontSize": settings.userFontSize, "isDarkModeEnabled": settings.isDarkModeEnabled] as [String : Any]
        
        AuthManager.shared.database.collection("settings").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update settings failed:", error)
                return
            }
        }
    }
    
}
