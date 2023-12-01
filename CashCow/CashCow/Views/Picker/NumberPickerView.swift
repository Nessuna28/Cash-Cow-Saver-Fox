//
//  NumberPickerView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NumberPickerView: View {
    
    var body: some View {
        HStack {
            Text(Strings.children)
            
            Spacer()
            
            Picker("", selection: $children) {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.automatic)
            .foregroundStyle(Colors.primaryGreen)
        }
    }
    
    // MARK: - Variables
    
    @State private var numbers = Array(0...5)
    
    @Binding var children: Int
    
}

#Preview {
    NumberPickerView(children: .constant(3))
}
