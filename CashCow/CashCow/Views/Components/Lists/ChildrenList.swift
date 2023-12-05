//
//  ViewForChildrenList.swift
//  CashCow
//
//  Created by Angelique Freier on 05.12.23.
//

import SwiftUI

struct ChildrenList: View {
    
    var body: some View {
        VStack {
            ForEach(children) { child in
                HStack(spacing: 20) {
                    Image(systemName: Strings.profileIconSystem)
                    
                    Text(child.loginName)
                    
                    Image(child.loginImage)
                        .resizable()
                        .imageSmallAndRound()
                }
                .foregroundColor(Colors.textColorOnS)
                .padding(5)
                .background(Colors.secondaryGray)
                .cornerRadius(6)
            }
        }
    }
    
    
    // MARK: - Variables
    
    let children: [FireChild]
}

#Preview {
    ChildrenList(children: [])
}
