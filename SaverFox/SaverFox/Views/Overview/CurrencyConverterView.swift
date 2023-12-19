//
//  CurrencyConverterView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct CurrencyConverterView: View {
    
    var body: some View {
        VStack {
            Text("Währungsrechner")
                .font(.largeTitle)
                .padding()
            
            Image("calculator")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            CurrencyPicker(text: "von:", currency: $fromCurrency)
            
            CurrencyPicker(text: "zu:", currency: $toCurrency)
            
            TextField("Betrag", text: $amount)
            
            Button("umrechnen") {
               setDataAndMakeRequest()
            }
            .bold()
            .foregroundColor(Colors.primaryOrange)
            .padding(30)
            
            if currencyConverterViewModel.data.result != 0.0 {
                Text("\(currencyConverterViewModel.amount) \(fromCurrency) sind umgerechnet")
                let text = "\(currencyConverterViewModel.data.result) \(toCurrency)"
                Text(text)
            }
            
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var currencyConverterViewModel = CurrencyConverterViewModel()
    
    @State private var amount = ""
    @State private var fromCurrency = ""
    @State private var toCurrency = ""
    
    
    
    // MARK: - Functions
    
    private func setDataAndMakeRequest() {
        
        currencyConverterViewModel.fromCurrency = currencyConverterViewModel.getCode(forCurrency: fromCurrency) ?? ""
        currencyConverterViewModel.toCurrency = currencyConverterViewModel.getCode(forCurrency: toCurrency) ?? ""
        currencyConverterViewModel.setAmount(amount: amount)
        currencyConverterViewModel.fetchData()
    }
    
}

#Preview {
    CurrencyConverterView()
}
