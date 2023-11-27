//
//  DisplayForEditFields.swift
//  CashCow
//
//  Created by Angelique Freier on 27.11.23.
//

import SwiftUI

struct DisplayForEditFields: View {
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: icon)
                .padding(5)
                .background(Colors.primaryColor)
                .clipShape(Circle())
            
            Text(title)
                .padding(.trailing, 20)
            
            Button {
                action()
            } label: {
                Image(systemName: Strings.arrowRight)
            }
        }
    }
    
    // MARK: - Variables
    
    let icon: String
    let title: String
    let action: () -> Void
    
}

#Preview {
    DisplayForEditFields(icon: Strings.settingsIcon, title: Strings.settings) { }
}
