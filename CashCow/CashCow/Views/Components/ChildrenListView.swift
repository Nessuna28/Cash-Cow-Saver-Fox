//
//  ChildrenListView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ChildrenListView: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    
    var body: some View {
        if let children = profileViewModel.fireUser?.childrenAccounts {
            List(children) { child in
                HStack {
                    Image(systemName: Strings.profileImageSystem)
                    
                    Text(child.loginName)
                    
                    Image(child.loginImage)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: Strings.trashIcon)
                    }
                }
            }
        }
    }
    
}

#Preview {
    ChildrenListView()
        .environmentObject(ProfileViewModel())
}
