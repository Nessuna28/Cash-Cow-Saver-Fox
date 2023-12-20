//
//  PrimaryButtonView.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    var body: some View {
        Text(title)
            .foregroundStyle(Colors.textColorOnP)
            .font(.headline)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Colors.primaryGreen)
            .cornerRadius(20)
    }
    
    
    // MARK: - Variables
    
    let title: String
    
}

#Preview {
    PrimaryButtonView(title: Strings.letsGo)
}
