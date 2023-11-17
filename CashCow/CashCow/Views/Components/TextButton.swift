//
//  TextButton.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import SwiftUI

struct TextButton: View {
    
    // MARK: - Variables
    
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
    
}

#Preview {
    TextButton(title: "Anmelden") { }
}
