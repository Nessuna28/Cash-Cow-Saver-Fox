//
//  ImageSmallAndRound.swift
//  CashCow
//
//  Created by Angelique Freier on 24.11.23.
//

import SwiftUI

struct ImageSmallAndRound: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Colors.textColorOnS, lineWidth: 1))
            .frame(width: 30, height: 30)
    }
}

extension View {
    
    func imageSmallAndRound() -> some View {
        modifier(ImageSmallAndRound())
    }
}
