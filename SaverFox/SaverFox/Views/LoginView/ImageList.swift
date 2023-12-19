//
//  ImageList.swift
//  SaverFox
//
//  Created by Angelique Freier on 06.12.23.
//

import SwiftUI

struct ImageList: View {
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridItems) {
                ForEach(LoginImage.allCases) { image in
                    Button {
                        loginImage = image.title
                    } label: {
                        image.image
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    private let gridItems = [GridItem(spacing: 10),
                             GridItem(spacing: 10),
                             GridItem(spacing: 10),
                             GridItem(spacing: 10),
                             GridItem(spacing: 10)]
    
    
    @Binding var loginImage: String
    
}

#Preview {
    ImageList(loginImage: .constant("Affe"))
}
