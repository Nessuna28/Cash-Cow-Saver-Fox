//
//  SecondaryButtonView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct SecondaryButtonView: View {
    
    // MARK: - Variables
    
    let title: String
    
    
    var body: some View {
        Text(title)
            .foregroundStyle(Colors.primaryColor)
            .font(.headline)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Colors.primaryColor, lineWidth: 1)
                    )
            )
    }
    
    
}

#Preview {
    SecondaryButtonView(title: "Abbrechen")
}
