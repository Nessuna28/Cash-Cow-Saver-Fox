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
            
            VStack {
                CurrencyPicker(text: "Von welcher Währung möchtest du umrechnen?", currency: $fromCurrency)
                
                CurrencyPicker(text: "In welche Währung möchtest du umrechnen?", currency: $toCurrency)
                
                Text("Gib den Betrag ein, den du umgerechnet haben möchtest")
                
                TextField("Betrag", text: $amount)
                
                Text("Gib nur einen Betrag ohne Komma ein!")
                    .font(.footnote)
                    .foregroundStyle(Colors.secondaryOrange)
                
                PrimaryButton(action: setDataAndMakeRequest, text: "umrechnen")
                .padding(40)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 30)
            
            if currencyConverterViewModel.data.result != 0.0 {
                Text("\(currencyConverterViewModel.amount) \(fromCurrencyTitle) sind umgerechnet")
                    .foregroundStyle(Colors.primaryOrange)
                
                Text(String(format: "%.2f \(toCurrencytTitle)", currencyConverterViewModel.data.result))
                    .foregroundStyle(Colors.primaryOrange)
            }
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .alert(isPresented: $currencyConverterViewModel.showAlert) {
            Alert(title: Text("Fehler"),
                  message: Text(currencyConverterViewModel.errorDescription ?? "Die Umrechnung hat nicht geklappt."),
                  dismissButton: .default(Text("Okay"))
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
        
        fromCurrencyTitle = currencyConverterViewModel.getTitle(forCurrency: fromCurrency) ?? "Euro"
        toCurrencytTitle = currencyConverterViewModel.getTitle(forCurrency: toCurrency) ?? "Euro"
        
        currencyConverterViewModel.fromCurrency = currencyConverterViewModel.getCode(forCurrency: fromCurrency) ?? ""
        currencyConverterViewModel.toCurrency = currencyConverterViewModel.getCode(forCurrency: toCurrency) ?? ""
        currencyConverterViewModel.setAmount(amount: amount)
        currencyConverterViewModel.fetchData()
    }
    
}

#Preview {
    CurrencyConverterView()
}
