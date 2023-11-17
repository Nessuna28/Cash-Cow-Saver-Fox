//
//  StartView.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                TextButton(title: "Anmelden", action: login)
                    .padding(30)
            }
            
            Text("Cash Cow")
                .font(.largeTitle)
            
            Image("CashCow")
            
            Text("")
        }
    }
    
    // MARK: - Functions
    
    private func login() {
        
    }
    
}

#Preview {
    StartView()
}
