//
//  ChildrenListView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ChildrenListView: View {
    
    var body: some View {
        List(childrenListViewModel.children) { child in
            Button {
                childProfileViewModel.currentChildId = child.id ?? ""
                childProfileViewModel.showSheetChildAccount.toggle()
            } label: {
                HStack(spacing: 20) {
                    if let image = childrenListViewModel.profileImages?.filter({ $0.key == child.id }) {
                        Image(uiImage: image[child.id ?? ""]!!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Colors.secondaryGray, lineWidth: 2))
                            .frame(width: 30)
                    } else {
                        Image(systemName: Strings.profileIconSystem)
                    }
                    
                    Text(child.loginName)
                    
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
        .toolbar {
            Button {
                childProfileViewModel.currentChildId = ""
                childProfileViewModel.showSheetNewChild.toggle()
            } label: {
                Image(systemName: Strings.plusCircleIcon)
            }
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
