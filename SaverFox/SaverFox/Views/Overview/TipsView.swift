//
//  TipsView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct TipsView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Strings.tips)
                .bold()
                .padding(.bottom)
            
            Text(tipViewModel.currentTip)
        }
        .foregroundColor(Colors.textColor)
        .padding()
        .background(Colors.secondaryOrange)
        .cornerRadius(10)
        .padding()
        .onAppear {
            tipViewModel.setCurrentTip()
        }
    }
    
    
    // MARK: - Variables
    
    @StateObject private var tipViewModel = TipViewModel()
    
}

#Preview {
    TipsView()
}
