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
            Text(Strings.pointsAccountIs)
                .font(.title)
            
            Text("\(pointsViewModel.points) \(Strings.points)")
                .font(.title)
                .padding(.bottom, 20)
            
            if let rewardClaimDate = pointsViewModel.rewardClaimDate,
               let remainingDays = Calendar.current.dateComponents([.day], from: rewardClaimDate, to: Date()).day,
               remainingDays >= 30 {
                Button(action: checkRewardAndUpdatePoints) {
                    Text(Strings.whetherRewardAvailable)
                }
            }
            
            Image("animation3-removebg")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 30)
            
            Text(Strings.whatToDoWithPoints)
                .padding(.bottom, 30)
            
            NavigationLink {
                GamesView()
                    .environmentObject(pointsViewModel)
            } label: {
                TextButton(action: pointsViewModel.unlockGames, title: Strings.unlockGames)
            }
            
            Text(Strings.orSo)
            
            TextButton(action: pointsViewModel.toggleShowRedeemSheet, title: Strings.redeemPoints)
        }
        .sheet(isPresented: $pointsViewModel.showRedeemSheet, content: {
            RedeemPointsView()
                .environmentObject(pointsViewModel)
        })
        .alert(isPresented: $pointsViewModel.showRewardAlert) {
            Alert(title: Text(Strings.reward),
                  message: Text(pointsViewModel.alertText),
                  dismissButton: .default(Text(Strings.okay))
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
