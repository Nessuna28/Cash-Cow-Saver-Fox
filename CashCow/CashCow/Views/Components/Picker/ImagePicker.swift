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
            Text("Anmeldebild")
            
            Spacer()
            
            Picker("Anmeldebild", selection: $loginImage) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
            .pickerStyle(.wheel)
        }
    }
    
    // MARK: - Variables
    
    @State private var images = ["affe", "dino", "elefant", "faultier", "giraffe", "hase", "hund", "katze", "koala", "krokodil", "loewe", "maus", "panda", "papagei", "reh", "robbe", "schaf", "schlange", "schwein", "tiger", "zebra"]
    
    @Binding var loginImage: String
    
}

#Preview {
    ImagePicker(loginImage: .constant("affe"))
}
