//
//  SettingsViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @AppStorage("appLock") var appLock = false
    
    @Published var settings: Settings?
    
    
    // MARK: - Functions
    
   
}
