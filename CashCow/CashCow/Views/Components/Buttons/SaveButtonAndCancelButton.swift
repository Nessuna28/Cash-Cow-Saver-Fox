//
//  ButtonsForProfile.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import SwiftUI

struct SaveButtonAndCancelButton: View {
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                PrimaryButtonView(title: Strings.cancel)
            }
            
            Spacer()
            
            Button {
                action()
                dismiss()
            } label: {
                PrimaryButtonView(title: Strings.save)
            }
        }
        .padding(.vertical, 30)
    }
    
    // MARK: - Variables
    
    @Environment(\.dismiss) var dismiss
    
    let action: () -> Void
    
}

#Preview {
    SaveButtonAndCancelButton { }
}
