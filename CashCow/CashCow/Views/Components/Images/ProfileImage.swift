//
//  ProfileImage.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import SwiftUI

struct ProfileImage: View {
    
    var body: some View {
        HStack {
            Image(Strings.adultWoman)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .frame(width: 100, height: 100)
            
            Spacer()
            
            Button("Bearbeiten") {
                updateProfileImage()
            }
        }
        .frame(height: 100)
    }
    
    
    // MARK: - Functions
    
    private func updateProfileImage() {
        
    }
    
}

#Preview {
    ProfileImage()
}
