//
//  SelectionAdultView.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct SelectionAdultView: View {
    
    var body: some View {
        HStack {
            Image(Strings.adultMen)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
            
            Image(Strings.adultWoman)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
            
            Spacer()
            
            Text(Strings.adult)
                .foregroundStyle(Colors.primaryGreen)
            
            Spacer()
            
            Image(systemName: Strings.arrowRight)
                .foregroundColor(Colors.primaryGreen)
                .padding(.trailing, 5)
            
            AppIcon()
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .background(Colors.secondaryGray)
        .cornerRadius(10)
        .padding(.horizontal, 30)
    }
    
}

#Preview {
    SelectionAdultView()
}
