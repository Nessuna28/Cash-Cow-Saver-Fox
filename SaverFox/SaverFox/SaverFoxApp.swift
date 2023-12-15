//
//  SaverFoxApp.swift
//  SaverFox
//
//  Created by Angelique Freier on 06.12.23.
//

import SwiftUI
import Firebase

@main
struct SaverFoxApp: App {
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
    
}
