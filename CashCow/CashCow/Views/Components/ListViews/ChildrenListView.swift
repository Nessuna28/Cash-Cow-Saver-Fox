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
            ForEach(childrenListViewModel.children) { child in
                NavigationLink {
                    ChildAccountView(child: child)
                } label: {
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Image(systemName: Strings.profileIconSystem)
                        
                        Text(child.loginName)
                       
                        Image(child.loginImage)
                            .resizable()
                            .imageSmallAndRound()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: Strings.trashIcon)
                                .foregroundColor(.blue)
                        }
                    }
                    .foregroundColor(Colors.textColorOnS)
                    .padding(5)
                    .background(Colors.secondaryGray)
                    .cornerRadius(6)
                }
            }
            
            NavigationLink {
                NewChildView()
                    .environmentObject(childProfileViewModel)
            } label: {
                TextButtonView(title: Strings.addChild)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear {
            childrenListViewModel.fetchChildren()
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    @EnvironmentObject var childProfileViewModel: ChildProfileViewModel
    
    
    
    // MARK: - Functions
    
    
    
}

#Preview {
    ChildrenListView()
        .environmentObject(ChildrenListViewModel())
        .environmentObject(ChildProfileViewModel())
}
