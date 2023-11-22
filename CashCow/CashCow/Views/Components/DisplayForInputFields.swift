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
                    .padding(.trailing, 50)
                
                Spacer()
                
                TextField(title, text: $input)
                    .foregroundColor(Colors.primaryColor)
                    .multilineTextAlignment(.trailing)
            }
            
            Divider()
        }
    }
    
}

#Preview {
    DisplayForInputFields(title: "Nachname", input: .constant(""))
}
