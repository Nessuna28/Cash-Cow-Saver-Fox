//
//  LoginTextFields.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import SwiftUI

struct LoginTextFields: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatedPassword: String = ""
    
    var body: some View {
        VStack {
            HStack{
                TextField(Strings.email, text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    
                Button {
                    deleteTextFieldInput(textInput: $email)
                } label: {
                    Image(systemName: Strings.deleteIcon)
                }
            }
            .padding()
            .border(Color.black, width: 1)
            .cornerRadius(3)
            .padding(.horizontal, 30)
            
            HStack{
                SecureField(Strings.password, text: $password)
                    
                Button {
                    deleteTextFieldInput(textInput: $password)
                } label: {
                    Image(systemName: Strings.deleteIcon)
                }
            }
            .padding()
            .border(Color.black, width: 1)
            .cornerRadius(3)
            .padding(.horizontal, 30)
            
            HStack{
                SecureField(Strings.repeatedPassword, text: $repeatedPassword)
                
                Button {
                    deleteTextFieldInput(textInput: $repeatedPassword)
                } label: {
                    Image(systemName: Strings.deleteIcon)
                }
            }
            .padding()
            .border(Color.black, width: 1)
            .cornerRadius(3)
            .padding(.horizontal, 30)
        }
    }
    
    // MARK: - Functions
    
    private func deleteTextFieldInput(textInput: Binding<String>) {
        
        textInput.wrappedValue = ""
    }
    
}

#Preview {
    LoginTextFields()
}
