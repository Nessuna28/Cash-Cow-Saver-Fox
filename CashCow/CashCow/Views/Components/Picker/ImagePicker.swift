//
//  ImagePicker.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import SwiftUI

struct ImagePicker: View {
    
    var body: some View {
        HStack {
            Text(Strings.loginImage)
            
            Spacer()
            
            Picker("", selection: $loginImage) {
                ForEach(LoginImages.allCases) { image in
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
    
    @Binding var loginImage: LoginImages
    
}

#Preview {
    ImagePicker(loginImage: .constant(.ape))
}
