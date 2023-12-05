//
//  ComparisonView.swift
//  CashCow
//
//  Created by Angelique Freier on 30.11.23.
//

import SwiftUI

struct ComparisonView: View {
    
    var body: some View {
        NavigationStack {
            Tab.comparison.icon
                .font(.title)
                .navigationTitle(Tab.comparison.title)
        }
    }
    
}

#Preview {
    ComparisonView()
}
