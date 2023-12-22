//
//  Tabbar.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct Tabbar: View {
    
    var body: some View {
        VStack {
            tabbarViewModel.selectedTab.view
                .environmentObject(financeViewModel)
                .environmentObject(savingViewModel)
                .padding(.vertical, 30)
            
            TabbarView()
                .environmentObject(tabbarViewModel)
        }
    }
    
    
    // MARK: - Variables
    
    @StateObject private var tabbarViewModel = TabbarViewModel()
    @StateObject private var financeViewModel = FinanceViewModel()
    @StateObject private var savingViewModel = SavingViewModel()
}

#Preview {
    Tabbar()
}
