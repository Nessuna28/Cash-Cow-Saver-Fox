//
//  RewardsView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct RewardsView: View {
    
    var body: some View {
        VStack {
            Text("Dein Punktekonto beträgt")
                .font(.title)
            
            Text("\(pointsViewModel.points) Punkte")
                .font(.title)
                .padding(.bottom, 20)
            
            if let rewardClaimDate = pointsViewModel.rewardClaimDate,
               let remainingDays = Calendar.current.dateComponents([.day], from: rewardClaimDate, to: Date()).day,
               remainingDays >= 30 {
                Button(action: checkRewardAndUpdatePoints) {
                    Text("Es ist Zeit zu gucken, ob dir eine Belohnung zusteht.")
                }
            }
            
            Image("animation3-removebg")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 30)
            
            Text("Was möchtest du mit deinen Punkten tun?")
                .padding(.bottom, 30)
            
            NavigationLink {
                GamesView()
                    .environmentObject(pointsViewModel)
            } label: {
                TextButton(action: pointsViewModel.unlockGames, title: "Spiele freischalten")
            }
            
            Text("oder")
            
            TextButton(action: pointsViewModel.toggleShowRedeemSheet, title: "Punkte bei deinen Eltern einlösen")
        }
        .sheet(isPresented: $pointsViewModel.showRedeemSheet, content: {
            RedeemPointsView()
                .environmentObject(pointsViewModel)
        })
        .alert(isPresented: $pointsViewModel.showRewardAlert) {
            Alert(title: Text("Belohnung"),
                  message: Text(pointsViewModel.alertText),
                  dismissButton: .default(Text("Okay"))
            )
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var pointsViewModel: PointsViewModel
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    
    // MARK: - Functions
    
    private func checkRewardAndUpdatePoints() {
        
        guard let id = profileViewModel.child?.id else { return }
        
        pointsViewModel.updateRewardClaimDate(with: id)
        pointsViewModel.addPoints(expenditure: financeViewModel.expenditure)
        pointsViewModel.updateCurrentPoints(with: id)
    }
    
}

#Preview {
    RewardsView()
        .environmentObject(PointsViewModel())
        .environmentObject(FinanceViewModel())
        .environmentObject(ProfileViewModel())
}
