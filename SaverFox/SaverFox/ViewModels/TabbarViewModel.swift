//
//  TabbarViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import Foundation

class TabbarViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var tabs = Tab.allCases
    @Published var selectedTab = Tab.allCases[0]
    
    let tabbarSize: CGFloat = 60
    
    
    // MARK: - Functions
    
    
}
