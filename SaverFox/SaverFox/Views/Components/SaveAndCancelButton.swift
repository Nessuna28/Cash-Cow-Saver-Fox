//
//  SaveAndCancelButton.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct SaveAndCancelButton: View {
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Text("Abbrechen")
                    .foregroundStyle(Colors.textColor)
            }
            
            Spacer()
            
            Button {
                action()
                dismiss()
            } label: {
                Text("Speichern")
                    .foregroundStyle(Colors.primaryOrange)
            }
        }
        .padding(30)
    }
    
    
    // MARK: - Variables
    
    @Environment(\.dismiss) private var dismiss
    
    let action: () -> Void
    
}

#Preview {
    SaveAndCancelButton(action: { })
}
