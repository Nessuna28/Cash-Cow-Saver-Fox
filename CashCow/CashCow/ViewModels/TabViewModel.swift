//
//  TabViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import Foundation

class TabViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var selectedTab: Tab = .home
    
}
