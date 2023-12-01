//
//  SelectionEnterWithCodeButton.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct SelectionEnterWithCodeButton: View {
    
    var body: some View {
        Button(action: saveSelection) {
            HStack {
                Text(Strings.enterWithCode)
                
                Spacer()
                
                Image(systemName: Strings.enterWithCodeImage)
                    .font(.largeTitle)
            }
            .foregroundColor(Colors.primaryGreen)
            .padding()
            .background(Colors.secondaryGray)
            .cornerRadius(10)
            .padding(.horizontal, 30)
        }
    }
    
    
    // MARK: - Functions
    
    private func saveSelection() {
        
    }
    
}

#Preview {
    SelectionEnterWithCodeButton()
}
