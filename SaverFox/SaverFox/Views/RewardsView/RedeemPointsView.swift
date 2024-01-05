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
            Text("Du möchtest Punkte bei deinen Eltern einlösen")
                .font(.title2)
                .padding(40)
            
            Text("Wieviel Punkte möchtest du einlösen?")
            
            TextField("Punkte", text: $pointsViewModel.inquiry)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding(40)
            
            PrimaryButton(action: sendInquiryAndCloseSheet, text: "Anfrage senden")
            
            Text("Für diese Anfrage werden dir \(pointsViewModel.inquiry) Punkte abgezogen.")
                .font(.footnote)
                .foregroundStyle(Colors.primaryOrange)
        }
        .alert(isPresented: $pointsViewModel.showAlert) {
            Alert(title: Text("Ungültige Eingabe"),
                  message: Text(pointsViewModel.alertText),
                  dismissButton: .default(Text("Okay"))
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
