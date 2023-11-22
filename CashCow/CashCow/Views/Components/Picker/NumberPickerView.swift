//
//  NumberPickerView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NumberPickerView: View {
    
    // MARK: - Variables
    
    @State private var numbers = Array(0...5)
    
    @Binding var children: Int
    
    
    var body: some View {
        Section {
            HStack {
                Text("Kinder")
                
                Spacer()
                
                Picker("Kinder", selection: $children) {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)")
                    }
                }
                .pickerStyle(.automatic)
                .foregroundStyle(Colors.primaryColor)
            }
            
            
        }
    }
    
}

#Preview {
    NumberPickerView(children: .constant(3))
}
