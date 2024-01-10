//
//  InquiryView.swift
//  CashCow
//
//  Created by Angelique Freier on 10.01.24.
//

import SwiftUI

struct InquiryView: View {
    
    var body: some View {
        VStack {
            Text(Strings.inquiry)
                .font(.title)
                .padding(.bottom, 50)
            
            Text("\(Strings.childWants) \(childProfileViewModel.fireChild?.inquiry ?? 0) \(Strings.redeemPoints)")
                .bold()
                .padding(.bottom, 30)
            
            Text(Strings.theyDecide)
            
            Spacer()
            
            Button(action: childProfileViewModel.openAlert) {
                Text(Strings.pointsHaveBeenRedeemed)
                    .foregroundStyle(Colors.primaryGreen)
                    .bold()
                    .padding()
                    .background(Colors.secondaryGray)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                
            }
            
            Spacer()
        }
        .padding()
        .alert(Strings.requestCompleted, isPresented: $childProfileViewModel.showAlert) {
            Button(Strings.okay, action: childProfileViewModel.deleteInquiry)
            Button(Strings.cancel, action: childProfileViewModel.closeAlert)
        } message: {
            Text(childProfileViewModel.alertText)
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var childProfileViewModel: ChildProfileViewModel
    
}

#Preview {
    InquiryView()
        .environmentObject(ChildProfileViewModel())
}
