//
//  SelectionFaceIdAndFingerprintButton.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct SelectionFaceIdAndFingerprintButton: View {
    
    var body: some View {
        Button(action: saveSelection) {
            HStack {
                Text(Strings.faceID)
                
                Text("/")
                
                Text(Strings.fingerprint)
                
                Spacer()
                
                Image(systemName: Strings.faceIDImage)
                    .font(.largeTitle)
                
                Image(systemName: Strings.fingerprintImage)
                    .font(.largeTitle)
            }
            .foregroundColor(Colors.primaryColor)
            .padding()
            .background(Colors.secondaryColor)
            .cornerRadius(10)
            .padding(.horizontal, 30)
        }
    }
    
    // MARK: - Functions
    
    private func saveSelection() {
        
    }
    
}

#Preview {
    SelectionFaceIdAndFingerprintButton()
}
