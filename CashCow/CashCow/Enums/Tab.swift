//
//  Tab.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation
import SwiftUI

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
    
    var icon: Image {
        switch self {
        case .home: return Image("house")
        case .comparison: return Image("scale")
        case .bankAccounts: return Image("bank")
        case .revenue: return Image("revenue")
        case .expenditure: return Image("expenditure")
        case .insurance: return Image("shield")
        case .save: return Image("piggybank")
        case .paidServices: return Image("paidservice")
        case .orderAndDeliveryOverview: return Image("delivery")
        case .diagrams: return Image("chart")
        }
    }
    
}
