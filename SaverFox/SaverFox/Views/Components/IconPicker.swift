//
//  IconPicker.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct IconPicker: View {
    
    var body: some View {
        Picker("", selection: $selectedIcon) {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
            }
        }
        .pickerStyle(.wheel)
    }
    
    
    // MARK: - Variables
    
    @Binding var selectedIcon: String
    
    @State private var icons = [
        "birthday.cake.fill",
        "giftcard.fill",
        "teddybear.fill",
        "iphone.gen1",
        "gamecontroller.fill",
        "applewatch",
        "airpodsmax",
        "cart.fill",
        "banknote.fill",
        "dishwasher.fill",
        "trash.fill",
        "house.fill",
        "dog.fill",
        "doc.richtext.fill",
    ]
}

#Preview {
    IconPicker(selectedIcon: .constant("giftcard.fill"))
}
