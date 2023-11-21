//
//  NavigationBar.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigationBar: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State var showSheet = false
    
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(authViewModel.fireUser?.firstName ?? Strings.guest)
                .foregroundColor(Colors.primaryColor)
                .padding(.trailing, 5)
            
            Image(systemName: Strings.profileImageSystem)
                .font(.title2)
            
            Spacer()
            
            AppIcon()
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Image(systemName: Strings.settingsImage)
                    .font(.title2)
                    .padding(.leading)
            })
        }
        .padding()
    }
    
}

#Preview {
    NavigationBar()
        .environmentObject(AuthViewModel())
}
