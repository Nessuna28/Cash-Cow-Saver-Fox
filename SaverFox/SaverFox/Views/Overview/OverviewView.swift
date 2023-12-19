//
//  OverviewView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct OverviewView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Taschengeld:")
                    .padding(.trailing, 30)
                
                Text("gib deinen Stand ein")
                    .foregroundStyle(Colors.primaryOrange)
            }
            
            HStack {
                Text("Punktekonto:")
                    .padding(.trailing, 30)
                
                Text("0 Punkte")
                    .foregroundStyle(Colors.primaryOrange)
                    .padding(.trailing, 30)
                
            }
            
            Image("animation1")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 30)
            
            Spacer()
            
            TipsView()
            
            Button(action: currencyConverterViewModel.openSheet) {
                HStack {
                    Image("calculator")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("Währungsrechner")
                }
            }
            .padding(30)
            .sheet(isPresented: $currencyConverterViewModel.showSheet) {
                CurrencyConverterView()
            }
        }
    }
    
    
    // MARK: - Variables
    
    @StateObject private var currencyConverterViewModel = CurrencyConverterViewModel()
    
}

#Preview {
    OverviewView()
}
