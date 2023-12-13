//
//  ChildrenListView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ChildrenListView: View {
    
    var body: some View {
        ForEach(childrenListViewModel.children) { child in
            Button {
                childProfileViewModel.currentChildId = child.id ?? ""
                childProfileViewModel.showSheetChildAccount.toggle()
            } label: {
                HStack(spacing: 20) {
                    ChildImage(id: child.id ?? "")
                        .environmentObject(childrenListViewModel)
                    
                    Text(child.loginName)
                    
                    Spacer()
                    
                    Image(child.loginImage)
                        .resizable()
                        .imageSmallAndRound()
                }
            }
            .sheet(isPresented: $childProfileViewModel.showSheetChildAccount) {
                ChildAccountView()
                    .environmentObject(childProfileViewModel)
            }
            .swipeActions(allowsFullSwipe: false) {
                Button(role: .destructive) {
                    childProfileViewModel.deleteChild(id: child.id ?? "")
                } label: {
                    Image(systemName: Strings.trashIcon)
                }
            }
        }
        .onAppear {
            childrenListViewModel.fetchChildren()
        }
        
        Button {
            childProfileViewModel.currentChildId = ""
            childProfileViewModel.showSheetNewChild.toggle()
        } label: {
            Text(Strings.addChild)
                .padding(.top, 20)
        }
        .sheet(isPresented: $childProfileViewModel.showSheetNewChild) {
            ChildAccountView()
                .environmentObject(childProfileViewModel)
        }
        .navigationTitle(Strings.childrenAccounts)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var childrenListViewModel: ChildrenListViewModel
    @EnvironmentObject private var childProfileViewModel: ChildProfileViewModel
    
}

#Preview {
    ChildrenListView()
        .environmentObject(ChildrenListViewModel())
        .environmentObject(ChildProfileViewModel())
}
