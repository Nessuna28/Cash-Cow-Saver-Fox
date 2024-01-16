//
//  GamesView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct GamesView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(Strings.collection)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 30)
            }
            
            VStack(alignment: .leading) {
                Text(Strings.forFivePoints)
                    .font(.footnote)
                    .foregroundStyle(Colors.textColor)
                    .bold()
                
                LazyVGrid(columns: gridItems) {
                    ForEach(gamesViewModel.fivePointsGame, id: \.name) { game in
                        GameImageAndTitle(gameCover: game.cover, gameName: game.name)
                    }
                }
            }
            
            Divider()
                .padding(.top, 50)
            
            VStack(alignment: .leading) {
                Text(Strings.forTenPoints)
                    .font(.footnote)
                    .foregroundStyle(Colors.textColor)
                    .bold()
                
                LazyVGrid(columns: gridItems) {
                    ForEach(gamesViewModel.tenPointsGame, id: \.name) { game in
                        GameImageAndTitle(gameCover: game.cover, gameName: game.name)
                    }
                }
            }
            
            Divider()
                .padding(.top, 50)
            
            VStack(alignment: .leading) {
                Text(Strings.forFifteenPoints)
                    .font(.footnote)
                    .foregroundStyle(Colors.textColor)
                    .bold()
                
                LazyVGrid(columns: gridItems) {
                    ForEach(gamesViewModel.fifteenPointsGame, id: \.name) { game in
                        GameImageAndTitle(gameCover: game.cover, gameName: game.name)
                    }
                }
            }
            
            Divider()
                .padding(.top, 50)
            
            VStack(alignment: .leading) {
                Text(Strings.forTwentyPoints)
                    .font(.footnote)
                    .foregroundStyle(Colors.textColor)
                    .bold()
                
                LazyVGrid(columns: gridItems) {
                    ForEach(gamesViewModel.twentyPointsGame, id: \.name) { game in
                        GameImageAndTitle(gameCover: game.cover, gameName: game.name)
                    }
                }
            }
            
            Divider()
                .padding(.top, 50)
        }
        .navigationTitle(Strings.games)
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var gamesViewModel = GamesViewModel()
    
    @EnvironmentObject private var pointsViewModel: PointsViewModel
    
    private let gridItems = [GridItem(spacing: 20),
                             GridItem(spacing: 20),
                             GridItem(spacing: 20)]
    
}

#Preview {
    GamesView()
        .environmentObject(PointsViewModel())
}
