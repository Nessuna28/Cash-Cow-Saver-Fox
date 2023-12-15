//
//  AppIcon.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct AppIcon: View {
    
    var body: some View {
        Image(Strings.appImage)
            .resizable()
            .scaledToFill()
            .frame(width: 25, height: 25)
    }
    
}

#Preview {
    AppIcon()
}
