//
//  GamesView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct GamesView: View {
    
    var body: some View {
        Text(Strings.games)
            .font(.title)
            .bold()
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var pointsViewModel: PointsViewModel
    
}

#Preview {
    GamesView()
        .environmentObject(PointsViewModel())
}
