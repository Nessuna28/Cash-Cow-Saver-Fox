//
//  DisplayForInputFields.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct DisplayForInputFields: View {
    
    let title: String
    @Binding var input: String
    
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                
                Spacer()
                
                
                TextField("", text: $input)
                    .foregroundColor(Colors.primaryColor)
                
                Button {
                    deleteTextFieldInput(textInput: $input)
                } label: {
                    Image(systemName: Strings.deleteIcon)
                }
                
            }
            
            Divider()
        }
    }
    
    // MARK: - Functions
    
    private func deleteTextFieldInput(textInput: Binding<String>) {
        
        textInput.wrappedValue = ""
    }
    
}

#Preview {
    DisplayForInputFields(title: "Nachname", input: .constant(""))
}
