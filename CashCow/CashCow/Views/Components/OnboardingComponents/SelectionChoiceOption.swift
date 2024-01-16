//
//  SelectionTab.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct SelectionChoiceOption: View {
    
    var body: some View {
        HStack {
            image
                .font(.title2)
                .foregroundColor(Colors.textColorOnS)
                .padding(8)
                .background(Colors.primaryGreen)
                .clipShape(Circle())
            
            Text(title)
                .foregroundColor(Colors.textColorOnS)
            
            Spacer()
            
            Button {
                isChecked.toggle()
                toggleTheRespectiveOption()
            } label: {
                Image(systemName: isChecked ? Strings.checkmarkFill : Strings.checkmarkEmpty)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(isChecked ? Colors.primaryGreen : Colors.textColorOnS)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .foregroundColor(Colors.textColorOnS)
        .background(Colors.secondaryGray)
        .cornerRadius(10)
        .padding(.horizontal, 30)
    }
    
    
    // MARK: - Variables
    
    let image: Image
    let title: String
    
    @State private var isChecked = false
    
    @EnvironmentObject private var choiceOptionViewModel: ChoiceOptionViewModel
    
    
    // MARK: - Functions
    
    private func toggleTheRespectiveOption() {
        
        if title == Strings.bankAccounts {
            choiceOptionViewModel.toggleBankAccounts()
        } else if title == Strings.creditCards {
            choiceOptionViewModel.toggleCreditCards()
        } else if title == Strings.insurance {
            choiceOptionViewModel.toggleInsurance()
        } else if title == Strings.savingAccounts {
            choiceOptionViewModel.toggleSavingAccounts()
        } else if title == Strings.paidServices {
            choiceOptionViewModel.togglePaidServices()
        } else if title == Strings.orderAndDeliveryOverview {
            choiceOptionViewModel.toggleOrderAndDeliveryOverview()
        }
    }
    
}

#Preview {
    SelectionChoiceOption(image: Image(Strings.bankIcon), title: Strings.bankAccounts)
        .environmentObject(ChoiceOptionViewModel())
}
