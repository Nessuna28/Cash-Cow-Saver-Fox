//
//  DisplayForEditFields.swift
//  CashCow
//
//  Created by Angelique Freier on 27.11.23.
//

import SwiftUI

struct DisplayForEditFields: View {
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: icon)
                    .padding(5)
                
                Text(title)
                    .padding(.trailing, 20)
                
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
