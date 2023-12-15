//
//  Tab.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import SwiftUI

enum Tab: String, Identifiable, CaseIterable {
    case overview, finance, saving, rewards, games
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .overview: return "Übersicht"
        case .finance: return "Finanzen"
        case .saving: return "Sparen"
        case .rewards: return "Belohnungen"
        case .games: return "Spiele"
        }
    }
    
    var icon: Image {
        switch self {
        case .overview: return Image("overview")
        case .finance: return Image("finance")
        case .saving: return Image("piggybank")
        case .rewards: return Image("rewards")
        case .games: return Image("games")
        }
    }
    
    var view: AnyView {
        switch self {
        case .overview: return AnyView(OverviewView())
        case .finance: return AnyView(FinanceView())
        case .saving: return AnyView(SavingView())
        case .rewards: return AnyView(RewardsView())
        case .games: return AnyView(GamesView())
        }
    }
}
