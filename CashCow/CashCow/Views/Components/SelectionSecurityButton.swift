//
//  SelectionSecurityButton.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct SelectionSecurityButton: View {
    
    // MARK: - Variables
    
    let title: String
    let image: String
    
    var body: some View {
        Button(action: saveSelection) {
            HStack {
                Text(title)
                
                Spacer()
                
                Image(systemName: image)
                    .font(.largeTitle)
            }
            .foregroundColor(Colors.primaryColor)
            .frame(width: 250)
            .padding()
            .background(Colors.secondaryColor)
            .cornerRadius(10)
        }
    }
    
    // MARK: - Functions
    
    private func saveSelection() {
        
    }
    
}

#Preview {
    SelectionSecurityButton(title: "Face-ID", image: "faceid")
}
