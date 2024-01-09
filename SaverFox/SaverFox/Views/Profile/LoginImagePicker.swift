//
//  LoginImagePicker.swift
//  SaverFox
//
//  Created by Angelique Freier on 22.12.23.
//

import SwiftUI

struct LoginImagePicker: View {
    
    var body: some View {
        HStack {
            Text(Strings.loginImage)
            
            Spacer()
            
            Picker("", selection: $loginImage) {
                ForEach(LoginImage.allCases) { image in
                    image.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
            .pickerStyle(.wheel)
        }
    }
    
    
    // MARK: - Variables
    
    @Binding var loginImage: String
    
}

#Preview {
    LoginImagePicker(loginImage: .constant("Faultier"))
}
