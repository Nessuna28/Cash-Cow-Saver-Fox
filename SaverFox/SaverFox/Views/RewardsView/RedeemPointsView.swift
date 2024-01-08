//
//  RedeemPointsView.swift
//  SaverFox
//
//  Created by Angelique Freier on 04.01.24.
//

import SwiftUI

struct RedeemPointsView: View {
    
    var body: some View {
        VStack {
            Text(Strings.youWantToRedeemPoints)
                .font(.title2)
                .padding(40)
            
            Text(Strings.howManyPointsToRedeem)
            
            TextField(Strings.points, text: $pointsViewModel.inquiry)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding(40)
            
            PrimaryButton(action: sendInquiryAndCloseSheet, text: Strings.sendRequest)
            
            Text("\(Strings.forThisRequest) \(pointsViewModel.inquiry) \(Strings.pointsDeducted).")
                .font(.footnote)
                .foregroundStyle(Colors.primaryOrange)
        }
        .alert(isPresented: $pointsViewModel.showAlert) {
            Alert(title: Text(Strings.invalidInput),
                  message: Text(pointsViewModel.alertText),
                  dismissButton: .default(Text(Strings.okay))
            )
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var pointsViewModel: PointsViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    
    // MARK: - Functions
    
    private func sendInquiryAndCloseSheet() {
        
        guard let id = profileViewModel.child?.id else { return }
        
        pointsViewModel.sendInquiry(id: id)
        pointsViewModel.toggleShowRedeemSheet()
    }
    
}

#Preview {
    RedeemPointsView()
        .environmentObject(PointsViewModel())
        .environmentObject(ProfileViewModel())
}
