//
//  SelectionChildButton.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI
import StoreKit

struct SelectionChildButton: View {
    
    var body: some View {
        Button {
            navigateToAppStore()
        } label: {
            HStack {
                Image(Strings.childBoy)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                
                Image(Strings.childGirl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                
                Spacer()
                
                Text(Strings.child)
                    .foregroundStyle(Colors.saverFoxColor)
                
                Spacer()
                
                Image(systemName: Strings.arrowRight)
                    .foregroundColor(Colors.saverFoxColor)
                    .padding(.trailing, 5)
                
                Image(Strings.saverFoxIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(Colors.secondaryGray)
            .cornerRadius(10)
            .padding(.horizontal, 30)
        }
    }
    
    // MARK: - Functions
    
    private func navigateToAppStore() {
        
        if #available(iOS 14.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first {
                SKStoreReviewController.requestReview(in: windowScene)
            }
        } else {
            if let appStoreURL = URL(string: "https://apps.apple.com/de/app/Saver Fox/id1234567890") {
                UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
            }
        }
    }
    
}

#Preview {
    SelectionChildButton()
}
