//
//  OverviewView.swift
//  CashCow
//
//  Created by Angelique Freier on 19.11.23.
//

import SwiftUI

struct OverviewView: View {
    
    // MARK: - Variables
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            NavigationBar()
                .environmentObject(authViewModel)
            
            NavigatorView()
        }
    }
    
}

#Preview {
    OverviewView()
        .environmentObject(AuthViewModel())
}
