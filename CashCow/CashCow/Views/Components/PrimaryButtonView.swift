//
//  PrimaryButtonView.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    // MARK: - Variables
    
    let title: String
    
    
    var body: some View {
        Text(title)
            .foregroundStyle(Colors.textColorOnP)
            .font(.title2)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Colors.primaryColor)
            .cornerRadius(20)
    }
    
}

#Preview {
    PrimaryButtonView(title: "Los geht´s")
}
