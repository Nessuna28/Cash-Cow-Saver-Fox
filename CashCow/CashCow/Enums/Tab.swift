//
//  Tab.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation
import SwiftUI

enum Tab: String, Identifiable, CaseIterable {
    
    case home, comparison, finance, bankAccounts, insurance, saving, paidServices, orderAndDeliveryOverview, diagrams
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .home: return Strings.home
        case .comparison: return Strings.comparison
        case .finance: return Strings.finance
        case .bankAccounts: return Strings.bankAccounts
        case .insurance: return Strings.insurance
        case .saving: return Strings.saving
        case .paidServices: return Strings.paidServices
        case .orderAndDeliveryOverview: return Strings.orderAndDeliveryOverview
        case .diagrams: return Strings.diagrams
        }
    }
    
    var icon: Image {
        switch self {
        case .home: return Image(Strings.homeIcon)
        case .comparison: return Image(Strings.scaleIcon)
        case .finance: return Image(Strings.financeIcon)
        case .bankAccounts: return Image(Strings.bankIcon)
        case .insurance: return Image(Strings.shieldIcon)
        case .saving: return Image(Strings.savingIcon)
        case .paidServices: return Image(Strings.paidServicesIcon)
        case .orderAndDeliveryOverview: return Image(Strings.deliveryIcon)
        case .diagrams: return Image(Strings.diagramIcon)
        }
    }
    
}
