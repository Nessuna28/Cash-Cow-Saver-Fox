//
//  SettingsViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 28.11.23.
//

import Foundation
import SwiftUI
import FirebaseAuth

class SettingsViewModel: ObservableObject {
    
    init() {
        settings = FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: .white, textColor: .black, userFontSize: "Mittel", isDarkModeEnabled: false)
        saveSettings()
    }
    
    
    // MARK: - Variables
    
    let fontSizes = ["Klein", "Mittel", "Groß"]
    
    
    @Published var showDesignSettings = false
    @Published var showNotificationSettings = false
    @Published var showCategoriesSettings = false
    
    @Published var settings: FireSettings
    
    @Published var fontSize = CGFloat(16)
    @Published var subtitleColor = Color.blue
    @Published var titleColor = Color.red
    
    
    
    // MARK: - Functions
    
    func saveSettings() {
        
        fontSize = setFont(settings.userFontSize)
        
        if settings.isDarkModeEnabled {
            settings.backgroundColor = .black
            settings.textColor = .white
        } else {
            settings.backgroundColor = settings.backgroundColor
            settings.textColor = settings.textColor
        }
        
        subtitleColor = setSubtitleColor()
        titleColor = setTitleColor()
    }
    
    
    private func setFont(_ font: String) -> CGFloat {
        
        switch font {
        case "Klein":
            return 12.0
        case "Mittel":
            return 16.0
        case "Groß":
            return 24.0
            
        default:
            return 16.0
        }
    }
    
    
    private func setSubtitleColor() -> Color {
        
        if settings.backgroundColor == .blue {
            return .white
        } else {
            return .blue
        }
    }
    
    
    private func setTitleColor() -> Color {
        
        if settings.backgroundColor == .red {
            return .white
        } else {
            return .red
        }
    }
}
