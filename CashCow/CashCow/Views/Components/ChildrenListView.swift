//
//  ChildrenListView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ChildrenListView: View {
    
    var body: some View {
        VStack {
            List(childrenListViewModel.children) { child in
                NavigationLink {
                    ChildAccountView(child: child)
                        .environmentObject(childrenListViewModel)
                } label: {
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
            
            NavigationLink {
                NewChildView()
            } label: {
                TextButtonView(title: "+ Kind hinzufügen")
            }
        }
        .onAppear {
            childrenListViewModel.fetchChildren()
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    
    
    
    // MARK: - Functions
    
    
    
}

#Preview {
    ChildrenListView()
        .environmentObject(ChildrenListViewModel())
}
