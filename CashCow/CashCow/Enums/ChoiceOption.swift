//
//  ChoiceOption.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import Foundation
import SwiftUI

enum ChoiceOption: String, Identifiable, CaseIterable {
    case bankAccounts, creditCards, insurance, savingAccounts, paidServices, orderAndDeliveryOverview
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .bankAccounts: return Strings.bankAccounts
        case .creditCards: return Strings.creditCards
        case .insurance: return Strings.insurance
        case .savingAccounts: return Strings.savingAccounts
        case .paidServices: return Strings.paidServices
        case .orderAndDeliveryOverview: return Strings.orderAndDeliveryOverview
        }
    }
    
    var icon: Image {
        switch self {
        case .bankAccounts: return Image(Strings.bankIcon)
        case .creditCards: return Image(Strings.creditCardIcon)
        case .insurance: return Image(Strings.shieldIcon)
        case .savingAccounts: return Image(Strings.savingIcon)
        case .paidServices: return Image(Strings.paidServicesIcon)
        case .orderAndDeliveryOverview: return Image(Strings.deliveryIcon)
        }
    }
    
    var isEnabled: Bool {
        switch self {
        case .bankAccounts: return ChoiceOptionViewModel.shared.bankAccounts
        case .creditCards: return ChoiceOptionViewModel.shared.creditCards
        case .insurance: return ChoiceOptionViewModel.shared.insurance
        case .savingAccounts: return ChoiceOptionViewModel.shared.savingAccounts
        case .paidServices: return ChoiceOptionViewModel.shared.paidServices
        case .orderAndDeliveryOverview: return ChoiceOptionViewModel.shared.orderAndDeliveryOverview
        }
    }
    
}
