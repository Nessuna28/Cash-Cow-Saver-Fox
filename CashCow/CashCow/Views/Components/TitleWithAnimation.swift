//
//  TitleWithAnimation.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct TitleWithAnimation: View {
    
    var body: some View {
        Text(Strings.appTitle)
            .font(.largeTitle)
            .bold()
        
        Text(Strings.appTitle)
            .font(.largeTitle)
            .bold()
            .rotationEffect(.degrees(180))
            .scaleEffect(x: -1, y: 1)
            .opacity(0.5)
        
        CashCowAnimation()
            .frame(width: 200, height: 200)
    }
    
}

#Preview {
    TitleWithAnimation()
}
