//
//  SelectionChildAccountMode.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import Foundation
import SwiftUI

enum SelectionChildAccountMode {
    case createChild, fetchChild
    
    
    var icon: String {
        switch self {
        case .createChild: return Strings.plusIcon
        case .fetchChild: return Strings.arrowRight
        }
    }
    
    var view: AnyView {
        switch self {
        case .createChild: return AnyView(ChildAccountView())
        case .fetchChild: return AnyView(ProfileView(fireUser: ProfileViewModel().fireUser ?? FireUser(id: "", email: "", firstName: "", registeredAt: Date())))
        }
    }
}
