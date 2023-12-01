//
//  CashCowAnimation.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct CashCowAnimation: View {
    
    // MARK: - Variables
    
    let images = ["cashcow1", "cashcow2", "cashcow3", "cashcow4", "cashcow5"]
    
    @State private var currentIndex = 0
    
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFit()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                currentIndex = (currentIndex + 1) % images.count
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
}

#Preview {
    CashCowAnimation()
}
