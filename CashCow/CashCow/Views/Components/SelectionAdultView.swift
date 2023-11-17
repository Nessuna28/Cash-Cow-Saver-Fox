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
                .foregroundStyle(Colors.primaryColor)
            
            Spacer()
            
            Image(systemName: Strings.arrowRight)
                .foregroundColor(Colors.primaryColor)
                .padding(.trailing, 5)
            
            AppIcon()
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .background(Colors.secondaryColor)
        .cornerRadius(10)
        .padding(.horizontal, 40)
    }
    
}

#Preview {
    SelectionAdultView()
}
