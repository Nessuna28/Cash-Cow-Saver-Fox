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
        
        let data = ["backgroundColor": settings.backgroundColor, "textColor": settings.textColor, "userFontSize": settings.userFontSize, "isDarkModeEnabled": settings.isDarkModeEnabled] as [String: Any]
        
        AuthManager.shared.database.collection("settings").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update settings failed:", error)
                return
            }
        }
    }
    
    
    static func fetchSettings(completion: @escaping (FireSettings) -> Void) {
        
        guard let userId = AuthManager.shared.auth.currentUser?.uid else { return }
        
        AuthManager.shared.database.collection("settings").document(userId).getDocument { document, error in
            if let error {
                print("Fetching settings failed:", error)
                completion(FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: UIColor(.white).colorToString(), textColor: UIColor(.black).colorToString(), userFontSize: Strings.medium, isDarkModeEnabled: false))
                return
            }
            
            guard let document else {
                print("No document!")
                completion(FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: UIColor(.white).colorToString(), textColor: UIColor(.black).colorToString(), userFontSize: Strings.medium, isDarkModeEnabled: false))
                return
            }
            
            do {
                let settings = try document.data(as: FireSettings.self)
                completion(settings)
            } catch {
                print("Document is not settings", error)
            }
        }
    }
    
}
