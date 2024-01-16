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
                    if let image = childrenListViewModel.profileImages[child.id ?? ""] {
                        Image(uiImage: image!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Colors.secondaryGray, lineWidth: 2))
                            .frame(width: 30)
                    } else {
                        Image(uiImage: UIImage(named: Strings.defaultProfilePicture)!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Colors.secondaryGray, lineWidth: 2))
                            .frame(width: 30)
                    }
                    
                    Text(child.loginName)
                    
                    Spacer()
                    
                    childrenListViewModel.getImage(forLoginImage: child.loginImage)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .swipeActions(allowsFullSwipe: false) {
                Button(role: .destructive) {
                    childProfileViewModel.deleteChild(id: child.id ?? "")
                } label: {
                    Image(systemName: Strings.trashIcon)
                }
            }
        }
        
        Button {
            childProfileViewModel.currentChildId = ""
            childProfileViewModel.showSheetNewChild.toggle()
        } label: {
            Text(Strings.addChild)
                .padding(.top, 20)
        }
        .sheet(isPresented: $childProfileViewModel.showSheetChildAccount, onDismiss: {
            childrenListViewModel.fetchChildren()
            childrenListViewModel.downloadPictures()
        }, content: {
            ChildAccountView()
                .environmentObject(childProfileViewModel)
        })
        .sheet(isPresented: $childProfileViewModel.showSheetNewChild, onDismiss: {
            childrenListViewModel.fetchChildren()
            childrenListViewModel.downloadPictures()
        }, content: {
            ChildAccountView()
                .environmentObject(childProfileViewModel)
        })
        .onAppear {
            childrenListViewModel.fetchChildren()
            childrenListViewModel.downloadPictures()
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
