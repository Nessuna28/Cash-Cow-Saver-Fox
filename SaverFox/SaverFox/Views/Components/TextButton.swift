//
//  TextButton.swift
//  SaverFox
//
//  Created by Angelique Freier on 04.01.24.
//

import SwiftUI

struct TextButton: View {
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(Colors.primaryOrange)
                .bold()
                .padding(30)
        }
    }
    
    
    // MARK: - Variables
    
    let action: () -> Void
    let title: String
    
}

#Preview {
    TextButton(action: { }, title: "")
}
