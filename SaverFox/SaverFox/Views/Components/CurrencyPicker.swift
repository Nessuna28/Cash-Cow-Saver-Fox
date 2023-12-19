//
//  CurrencyPicker.swift
//  SaverFox
//
//  Created by Angelique Freier on 19.12.23.
//

import SwiftUI

struct CurrencyPicker: View {
    
    var body: some View {
        HStack {
            Text(text)
            
            Picker("", selection: $currency) {
                ForEach(Currency.allCases) { currency in
                    Text(currency.title)
                }
            }
            .pickerStyle(.automatic)
        }
    }
    
    // MARK: - Variables
    
    let text: String
    
    @Binding var currency: String
    
}

#Preview {
    CurrencyPicker(text: "von:", currency: .constant(""))
}
