//
//  FinanceView.swift
//  CashCow
//
//  Created by Angelique Freier on 30.11.23.
//

import SwiftUI

struct FinanceView: View {
    
    var body: some View {
        NavigationStack {
            Tab.finance.icon
                .font(.title)
                .navigationTitle(Tab.finance.title)
        }
    }
    
}

#Preview {
    FinanceView()
}
