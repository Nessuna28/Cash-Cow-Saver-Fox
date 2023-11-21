//
//  Tab.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation

enum Tab: String, Identifiable, CaseIterable {
    
    case home, comparison, bankAccounts, revenue, expenditure, insurance, save, paidServices, orderAndDeliveryOverview, diagrams
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .comparison: return "Gegenüberstellung"
        case .bankAccounts: return "Konten"
        case .revenue: return "Einnahmen"
        case .expenditure: return "Ausgaben"
        case .insurance: return "Versicherungen"
        case .save: return "Sparen"
        case .paidServices: return "Bezahldienste"
        case .orderAndDeliveryOverview: return "Bestell- u. Lieferübersicht"
        case .diagrams: return "Diagramme"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .comparison: return ""
        case .bankAccounts: return ""
        case .revenue: return ""
        case .expenditure: return ""
        case .insurance: return ""
        case .save: return ""
        case .paidServices: return ""
        case .orderAndDeliveryOverview: return ""
        case .diagrams: return ""
        }
    }
    
}
