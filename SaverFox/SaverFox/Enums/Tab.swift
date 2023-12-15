//
//  Tab.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation

enum Tab: String, Identifiable, CaseIterable {
    case overview, finance, saving, pointsAccount, games
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .overview: return "Übersicht"
        case .finance: return "Finanzen"
        case .saving: return "Sparen"
        case .pointsAccount: return "Punktekonto"
        case .games: return "Spiele"
        }
    }
}
