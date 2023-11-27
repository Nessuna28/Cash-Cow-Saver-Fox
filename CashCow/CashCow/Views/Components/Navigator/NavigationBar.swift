//
//  NavigationBar.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigationBar: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                
                Spacer()
                
                ProfileNameAndImage()
                    .environmentObject(profileViewModel)
                
                Spacer()
                
                AppIcon()
                
                EditButton()
            }
            .padding()
        }
    }
    
}

#Preview {
    NavigationBar()
        .environmentObject(ProfileViewModel())
}
