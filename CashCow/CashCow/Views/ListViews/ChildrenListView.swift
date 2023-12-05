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
                HStack(spacing: 20) {
                    Image(systemName: Strings.profileIconSystem)
                    
                    Text(child.loginName)
                    
                    Image(child.loginImage)
                        .resizable()
                        .imageSmallAndRound()
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                withAnimation {
                                    childProfileViewModel.deleteChild(id: child.id ?? "")
                                }
                            } label: {
                                Image(systemName: Strings.deleteIcon)
                            }
                            
                            Button {
                                showSheet.toggle()
                            } label: {
                                Image(systemName: Strings.pencilIcon)
                            }
                        }
                }
                .foregroundColor(Colors.textColorOnS)
                .padding(5)
                .background(Colors.secondaryGray)
                .cornerRadius(6)
                .sheet(isPresented: $showSheet) {
                    ChildAccountView(child: child)
                }
            }
            
            NavigationLink {
                NewChildView()
                    .environmentObject(childProfileViewModel)
            } label: {
                Text(Strings.addChild)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
            }
        }
        .onAppear {
            childrenListViewModel.fetchChildren()
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    @EnvironmentObject var childProfileViewModel: ChildProfileViewModel
    
    @State private var showSheet = false
    
}

#Preview {
    ChildrenListView()
        .environmentObject(ChildrenListViewModel())
        .environmentObject(ChildProfileViewModel())
}
