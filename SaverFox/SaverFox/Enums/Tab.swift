//
//  Tab.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import SwiftUI

enum Tab: String, Identifiable, CaseIterable {
    case overview, finance, saving, rewards
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .overview: return Strings.overview
        case .finance: return Strings.finances
        case .saving: return Strings.saving
        case .rewards: return Strings.rewards
        }
    }
    
    var icon: Image {
        switch self {
        case .overview: return Image("overview")
        case .finance: return Image("finance")
        case .saving: return Image("piggybank")
        case .rewards: return Image("rewards")
        }
    }
    
    var view: AnyView {
        switch self {
        case .overview: return AnyView(OverviewView())
        case .finance: return AnyView(FinanceView())
        case .saving: return AnyView(SavingView())
        case .rewards: return AnyView(RewardsView())
        }
    }
}
