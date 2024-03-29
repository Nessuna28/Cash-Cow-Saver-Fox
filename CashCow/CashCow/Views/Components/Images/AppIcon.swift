//
//  AppIcon.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct AppIcon: View {
    
    var body: some View {
        Image(Strings.appIcon)
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30)
    }
    
}

#Preview {
    AppIcon()
}
