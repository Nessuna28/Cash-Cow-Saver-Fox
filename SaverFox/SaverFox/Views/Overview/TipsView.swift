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
            Text("Tipps")
                .bold()
                .padding(.bottom)
            
            Text("Gib nicht alles auf einmal aus")
        }
        .padding()
        .background(Colors.secondaryOrange)
        .cornerRadius(10)
        .padding()
    }
    
}

#Preview {
    TipsView()
}
