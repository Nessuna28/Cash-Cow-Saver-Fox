//
//  ChildImage.swift
//  CashCow
//
//  Created by Angelique Freier on 13.12.23.
//

import SwiftUI

struct ChildImage: View {
    
    var body: some View {
        if let image = childrenListViewModel.profileImages[id] {
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
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var childrenListViewModel: ChildrenListViewModel
    
    let id: String
    
}

#Preview {
    ChildImage(id: "")
        .environmentObject(ChildrenListViewModel())
}
