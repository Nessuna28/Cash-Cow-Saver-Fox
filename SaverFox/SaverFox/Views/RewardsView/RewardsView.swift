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
                .padding(.bottom, 40)
            
            Spacer()
            
            Text("Was möchtest du mit deinen Punkten tun?")
                .padding(.bottom, 40)
            
            NavigationLink {
                GamesView()
                    .environmentObject(pointsViewModel)
            } label: {
                TextButton(action: pointsViewModel.unlockGames, title: "Spiele freischalten")
            }
            
            Text("oder")
            
            TextButton(action: pointsViewModel.toggleShowRedeemSheet, title: "Punkte bei deinen Eltern einlösen")
            
            Spacer()
            
        }
        .sheet(isPresented: $pointsViewModel.showRedeemSheet, content: {
            RedeemPointsView()
                .environmentObject(pointsViewModel)
        })
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var pointsViewModel: PointsViewModel
    
}

#Preview {
    RewardsView()
        .environmentObject(PointsViewModel())
}
