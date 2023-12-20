//
//  SecondaryButtonView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct SecondaryButtonView: View {
    
    var body: some View {
        Text(title)
            .foregroundStyle(Colors.primaryGreen)
            .font(.headline)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Colors.primaryGreen, lineWidth: 1)
                    )
            )
    }
    
    
    // MARK: - Variables
    
    let title: String
    
}

#Preview {
    SecondaryButtonView(title: Strings.cancel)
}
