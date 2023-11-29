//
//  TextButtonView.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import SwiftUI

struct TextButtonView: View {
    
    // MARK: - Variables
    
    let title: String
    
    
    var body: some View {
        Text(title)
            .font(.headline)
            .bold()
            .padding()
    }
    
}

#Preview {
    TextButtonView(title: Strings.login)
}
