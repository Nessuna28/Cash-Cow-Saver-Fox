//
//  PrimaryButton.swift
//  SaverFox
//
//  Created by Angelique Freier on 20.12.23.
//

import SwiftUI

struct PrimaryButton: View {
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .foregroundColor(Colors.textColor)
                .bold()
                .background(Colors.primaryOrange)
                .cornerRadius(20)
                .padding(40)
        }
    }
            
            
    // MARK: - Variables
    
    let action: () -> Void
    let text: String
    
}

#Preview {
    PrimaryButton(action: { }, text: "umrechnen")
}
