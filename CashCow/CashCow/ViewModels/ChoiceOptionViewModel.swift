//
//  ChoiceOptionViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 10.01.24.
//

import Foundation
import FirebaseFirestore

class ChoiceOptionViewModel: ObservableObject {
    
    static let shared = ChoiceOptionViewModel()
    
    // MARK: - Variables
    
    @Published var bankAccounts = false
    @Published var creditCards = false
    @Published var insurance = false
    @Published var savingAccounts = false
    @Published var paidServices = false
    @Published var orderAndDeliveryOverview = false
    
    
    @Published var user: FireUser?
    @Published var choiceOptions: [FireChoiceOption] = []
    
    private var listener: ListenerRegistration?
    
    
    // MARK: - Functions
    
    func toggleBankAccounts() {
        
        bankAccounts.toggle()
    }
    
    
    func toggleCreditCards() {
        
        creditCards.toggle()
    }
    
    
    func toggleInsurance() {
        
        insurance.toggle()
    }
    
    
    func toggleSavingAccounts() {
        
        savingAccounts.toggle()
    }
    
    func togglePaidServices() {
        
        paidServices.toggle()
    }
    
    func toggleOrderAndDeliveryOverview() {
        
        orderAndDeliveryOverview.toggle()
    }
    
    
    func createChoiceOption(id: String) {
        
        if bankAccounts {
            FirebaseRepository.createChoiceOption(with: id, title: Strings.bankAccounts, icon: Strings.bankIcon, isEnabled: bankAccounts)
        }
        
        if creditCards {
            FirebaseRepository.createChoiceOption(with: id, title: Strings.creditCards, icon: Strings.creditCardIcon, isEnabled: creditCards)
        }
        
        if insurance {
            FirebaseRepository.createChoiceOption(with: id, title: Strings.insurance, icon: Strings.shieldIcon, isEnabled: insurance)
        }
        
        if savingAccounts {
            FirebaseRepository.createChoiceOption(with: id, title: Strings.savingAccounts, icon: Strings.savingIcon, isEnabled: savingAccounts)
        }
        
        if paidServices {
            FirebaseRepository.createChoiceOption(with: id, title: Strings.paidServices, icon: Strings.paidServicesIcon, isEnabled: paidServices)
        }
        
        if orderAndDeliveryOverview {
            FirebaseRepository.createChoiceOption(with: id, title: Strings.orderAndDeliveryOverview, icon: Strings.deliveryIcon, isEnabled: orderAndDeliveryOverview)
        }
    }
    
    
    func fetchChoiceOptions(with id: String) {
        
        listener = AuthManager.shared.database.collection("users").document(id).collection("choiceOptions")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print("Fetching choice options failed:", error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No document!")
                    return
                }
                
                self.choiceOptions = documents.compactMap { queryDocumentSnapshot -> FireChoiceOption? in
                    try? queryDocumentSnapshot.data(as: FireChoiceOption.self)
                }
                
                self.setSelectedChoiseOptionToTrue()
            }
    }
    
    
    private func setSelectedChoiseOptionToTrue() {
        
        for choiceOption in choiceOptions {
            if choiceOption.title == Strings.bankAccounts {
                bankAccounts = choiceOption.isEnabled
            } else if choiceOption.title == Strings.creditCards {
                creditCards = choiceOption.isEnabled
            } else if choiceOption.title == Strings.insurance {
                insurance = choiceOption.isEnabled
            } else if choiceOption.title == Strings.savingAccounts {
                savingAccounts = choiceOption.isEnabled
            } else if choiceOption.title == Strings.paidServices {
                paidServices = choiceOption.isEnabled
            } else if choiceOption.title == Strings.orderAndDeliveryOverview {
                orderAndDeliveryOverview = choiceOption.isEnabled
            }
        }
    }
    
    
    func removeListener() {
        
        choiceOptions.removeAll()
        listener?.remove()
    }
}
