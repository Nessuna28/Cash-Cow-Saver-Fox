//
//  EditButton.swift
//  CashCow
//
//  Created by Angelique Freier on 27.11.23.
//

import SwiftUI

struct EditButton: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var editViewModel: EditViewModel
    
    
    var body: some View {
        Button {
            withAnimation {
                editViewModel.showProcessingSheet.toggle()
            }
        } label: {
            Image(systemName: Strings.editIcon)
                .font(.title2)
                .padding(.leading)
                .opacity(editViewModel.showProcessingSheet ? 0 : 1)
        }
    }
    
}



#Preview {
    EditButton()
        .environmentObject(EditViewModel())
}
