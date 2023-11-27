//
//  SettingsButton.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct SettingsButton: View {
    
    // MARK: - Variables
    
    @State private var showSettingsSheet = false
    
    
    var body: some View {
        Button {
            showSettingsSheet.toggle()
        } label: {
            Image(systemName: Strings.settingsIcon)
                .font(.title2)
                .padding(.leading)
        }
    }
    
}

#Preview {
    SettingsButton()
}
