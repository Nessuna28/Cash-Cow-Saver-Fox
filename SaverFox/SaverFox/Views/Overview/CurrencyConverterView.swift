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
            Text(Strings.currencyConverter)
                .font(.largeTitle)
                .padding()
            
            Image("calculator")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            VStack {
                CurrencyPicker(text: Strings.fromWhichCurrency, currency: $fromCurrency)
                
                CurrencyPicker(text: Strings.inWhichCurrency, currency: $toCurrency)
                
                Text(Strings.enterAmountToConvert)
                
                TextField(Strings.amount, text: $amount)
                
                Text(Strings.enterInt)
                    .font(.footnote)
                    .foregroundStyle(Colors.secondaryOrange)
                
                PrimaryButton(action: setDataAndMakeRequest, text: Strings.convert)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 30)
            
            if currencyConverterViewModel.data.result != 0.0 {
                Text("\(currencyConverterViewModel.amount) \(fromCurrencyTitle) \(Strings.areConverted)")
                    .foregroundStyle(Colors.primaryOrange)
                
                Text(String(format: "%.2f \(toCurrencytTitle)", currencyConverterViewModel.data.result))
                    .foregroundStyle(Colors.primaryOrange)
            }
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .alert(isPresented: $currencyConverterViewModel.showAlert) {
            Alert(title: Text(Strings.error),
                  message: Text(currencyConverterViewModel.errorDescription ?? Strings.conversionFailed),
                  dismissButton: .default(Text(Strings.okay))
            )
        }
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var currencyConverterViewModel = CurrencyConverterViewModel()
    
    @State private var amount = ""
    @State private var fromCurrency = ""
    @State private var toCurrency = ""
    
    @State private var fromCurrencyTitle = ""
    @State private var toCurrencytTitle = ""
    
    
    
    // MARK: - Functions
    
    private func setDataAndMakeRequest() {
        
        fromCurrencyTitle = currencyConverterViewModel.getTitle(forCurrency: fromCurrency) ?? Strings.euro
        toCurrencytTitle = currencyConverterViewModel.getTitle(forCurrency: toCurrency) ?? Strings.euro
        
        currencyConverterViewModel.fromCurrency = currencyConverterViewModel.getCode(forCurrency: fromCurrency) ?? ""
        currencyConverterViewModel.toCurrency = currencyConverterViewModel.getCode(forCurrency: toCurrency) ?? ""
        currencyConverterViewModel.setAmount(amount: amount)
        currencyConverterViewModel.fetchData()
    }
    
}

#Preview {
    CurrencyConverterView()
}
