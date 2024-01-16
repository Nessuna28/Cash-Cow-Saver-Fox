//
//  GameImageAndTitle.swift
//  SaverFox
//
//  Created by Angelique Freier on 09.01.24.
//

import SwiftUI

struct GameImageAndTitle: View {
    
    var body: some View {
        NavigationLink {
            
        } label: {
            VStack {
                Image(gameCover)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 40)
                
                Text(gameName)
                    .foregroundStyle(Colors.primaryOrange)
                    .font(.footnote)
            }
        }
    }
    
    
    // MARK: - Variables
    
    let gameCover: String
    let gameName: String
    
}

#Preview {
    GameImageAndTitle(gameCover: "", gameName: "schnick")
}
