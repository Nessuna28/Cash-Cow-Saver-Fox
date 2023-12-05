//
//  DiagramsView.swift
//  CashCow
//
//  Created by Angelique Freier on 30.11.23.
//

import SwiftUI

struct DiagramsView: View {
    
    var body: some View {
        NavigationStack {
            Tab.diagrams.icon
                .font(.title)
                .navigationTitle(Tab.diagrams.title)
        }
    }
    
}

#Preview {
    DiagramsView()
}
