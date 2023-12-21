//
//  NewSavingsGoalView.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct NewSavingsGoalView: View {
    
    var body: some View {
        VStack {
            Text("Sparziel hinzufügen")
                .font(.title)
            
            VStack {
                TextField("Titel", text: $title)
            }
        }
    }
    
    
    // MARK: - Variables
    
    @State private var title = ""
    
}

#Preview {
    NewSavingsGoalView()
}
