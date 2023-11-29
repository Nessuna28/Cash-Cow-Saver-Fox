//
//  SelectionTab.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct SelectionChoiceOption: View {
    
    // MARK: - Variables
    
    let image: Image
    let title: String
    
    @State private var isChecked = false
    
    var body: some View {
        HStack {
            image
                .font(.title2)
                .padding(8)
                .background(Colors.primaryColor)
                .clipShape(Circle())
            
            Text(title)
            
            Spacer()
            
            Button(action: {
                        isChecked.toggle()
                    }) {
                        Image(systemName: isChecked ? Strings.checkmarkFill : Strings.checkmarkEmpty)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(isChecked ? Colors.primaryColor : Colors.textColorOnS)
                    }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .foregroundColor(Colors.textColorOnS)
        .background(Colors.secondaryColor)
        .cornerRadius(10)
        .padding(.horizontal, 30)
    }
    
}

#Preview {
    SelectionChoiceOption(image: Image(Strings.bankIcon), title: Strings.bankAccounts)
}
