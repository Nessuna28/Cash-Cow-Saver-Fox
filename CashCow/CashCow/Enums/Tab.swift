//
//  Tab.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation
import SwiftUI

enum Tab: String, Identifiable, CaseIterable {
    
    case home, comparison, finance, diagrams, settings
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .home: return Strings.home
        case .comparison: return Strings.comparison
        case .finance: return Strings.finance
        case .diagrams: return Strings.diagrams
        case .settings: return Strings.settings
        }
    }
    
    var icon: Image {
        switch self {
        case .home: return Image(Strings.homeIcon)
        case .comparison: return Image(Strings.scaleIcon)
        case .finance: return Image(Strings.financeIcon)
        case .diagrams: return Image(Strings.diagramIcon)
        case .settings: return Image(Strings.settingsIcon)
        }
    }
    
    var view: AnyView {
        switch self {
        case .home: return AnyView(OverviewView())
        case .comparison: return AnyView(ComparisonView())
        case .finance: return AnyView(FinanceView())
        case .diagrams: return AnyView(DiagramsView())
        case .settings: return AnyView(SettingsView())
        }
    }
    
}
