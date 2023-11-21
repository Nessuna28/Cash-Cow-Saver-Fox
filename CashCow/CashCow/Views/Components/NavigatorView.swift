//
//  NavigatorView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigatorView: View {
    
    // MARK: - Variables
    
    @State private var selectedTab: Tab = .home
    
    
    var body: some View {
        ScrollView(.horizontal) {
            
            HStack {
                ForEach(Tab.allCases) { tab in
                    TabViewForNavigationBar(selectedTab: selectedTab)
                        .onTapGesture {
                            selectedTab = tab
                        }
                }
                .padding()
                .foregroundColor(Colors.textColorOnS)
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Colors.primaryColor)
                        .offset(x: getTabOffset(), y: 30)
                )
            }
        }
        .background(Colors.secondaryColor)
    }
    
                                
    // MARK: - Functions
    
    private func getTabOffset() -> CGFloat {
        guard let selectedIndex = Tab.allCases.firstIndex(of: selectedTab) else {
            return 0
        }
        
        let tabWidth = UIScreen.main.bounds.width / CGFloat(Tab.allCases.count)
        return CGFloat(selectedIndex) * tabWidth
    }
    
}

#Preview {
    NavigatorView()
}
