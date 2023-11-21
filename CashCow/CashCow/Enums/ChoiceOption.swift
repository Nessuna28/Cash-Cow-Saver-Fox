//
//  ChoiceOption.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import Foundation

enum ChoiceOption: String, Identifiable, CaseIterable {
    
    case banks, creditCards, insurance, savingAccounts, paidServices, orderAndDeliveryOverview
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .banks: return "Banken"
        case .creditCards: return "Kreditkarten"
        case .insurance: return "Versicherungen"
        case .savingAccounts: return "Sparkonten"
        case .paidServices: return "Bezahldienste"
        case .orderAndDeliveryOverview: return "Bestell- u. Lieferübersicht"
        }
    }
    
    var icon: String {
        switch self {
        case .banks: return "building.columns.fill"
        case .creditCards: return "creditcard.fill"
        case .insurance: return "shield.checkered"
        case .savingAccounts: return "banknote.fill" // TODO: noch ändern
        case .paidServices: return "banknote.fill"   // TODO: noch ändern
        case .orderAndDeliveryOverview: return "truck.box.fill"
        }
    }
    

}
