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
        
        settings = FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: UIColor(.white).colorToString(), textColor: UIColor(.black).colorToString(), userFontSize: Strings.medium, isDarkModeEnabled: false)
        
        fetchSettings()
    }
    
    
    // MARK: - Variables
    
    let fontSizes = [Strings.small, Strings.medium, Strings.large]
    
    @Published var settings: FireSettings
    
    @Published var fontSize = CGFloat(16)
    @Published var subtitleColor = Color.blue
    @Published var titleColor = Colors.primaryGreen
    
    @Published var backgroundColorFromPicker = Color.white
    @Published var textColorFromPicker = Color.black
    
    @Published var showAlert = false
   
    
    
    
    // MARK: - Computed Property
    
    var backgroundColor: UIColor {
        stringToColor(hexString: settings.backgroundColor)
    }
    
    var textColor: UIColor {
        stringToColor(hexString: settings.textColor)
    }

    
    
    
    // MARK: - Functions
    
    func setSettings() {
        
        fontSize = setFont(settings.userFontSize)
        
        if settings.isDarkModeEnabled {
            settings.backgroundColor = UIColor(.black).colorToString()
            settings.textColor = UIColor(.white).colorToString()
        } else {
            settings.backgroundColor = UIColor(backgroundColorFromPicker).colorToString()
            settings.textColor = UIColor(textColorFromPicker).colorToString()
        }
        
        subtitleColor = setSubtitleColor()
        titleColor = setTitleColor()
    }
    
    
    func createSettings() {
        
        setSettings()
        
        if let uid = AuthManager.shared.auth.currentUser?.uid {
            SettingsRepository.createSettings(with: uid, settings: settings)
        }
    }
    
    
    func updateSettings() {
        
        setSettings()
        
        SettingsRepository.updateSettings(with: AuthManager.shared.auth.currentUser?.uid ?? "", settings: settings)
        
        fetchSettings()
    }
    
    
    func resetSettings() {
        
        settings = FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: UIColor(.white).colorToString(), textColor: UIColor(.black).colorToString(), userFontSize: Strings.medium, isDarkModeEnabled: false)
        
        self.updateSettings()
    }
    
    
    func fetchSettings() {
        
        setSettings()
        
        if let uid = AuthManager.shared.auth.currentUser?.uid {
            SettingsRepository.fetchSettings { settings in
                
                self.settings = settings
            }
        }
    }
        
    
    private func setFont(_ font: String) -> CGFloat {
        
        switch font {
        case Strings.small:
            return 12.0
        case Strings.medium:
            return 16.0
        case Strings.large:
            return 24.0
            
        default:
            return 16.0
        }
    }
    
    
    private func setSubtitleColor() -> Color {
        
        if settings.backgroundColor == UIColor(.blue).colorToString() {
            return .white
        } else {
            return .blue
        }
    }
    
    
    private func setTitleColor() -> Color {
        
        if settings.backgroundColor == UIColor(Colors.primaryGreen).colorToString() {
            return .white
        } else {
            return .red
        }
    }
    
    
    func stringToColor(hexString: String) -> UIColor {
        
        let colorComponents = hexString.split(separator: ", ").compactMap { Float($0) }
        
        guard colorComponents.count >= 3 else {
            return .clear
        }
        
        let red = CGFloat(colorComponents[0])
        let green = CGFloat(colorComponents[1])
        let blue = CGFloat(colorComponents[2])
        let alpha = CGFloat(colorComponents[3])
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}


extension UIColor {
    
    func colorToString() -> String {
        
        guard let colorComponents = self.cgColor.components else {
            return ""
        }
        
        let red = CGFloat(colorComponents[0])
        let green = CGFloat(colorComponents[1])
        let blue = CGFloat(colorComponents[2])
        let alpha = CGFloat(colorComponents[3])
        
        return "\(red), \(green), \(blue), \(alpha)"
    }
}
