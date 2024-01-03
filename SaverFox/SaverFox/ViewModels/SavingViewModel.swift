//
//  SavingViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import Foundation
import FirebaseFirestore

class SavingViewModel: ObservableObject {
    
    
    // MARK: - Variables
    
    @Published var savingsGoalList: [SavingsGoal] = []
    
    @Published var savingsGoal: SavingsGoal?
    
    @Published var date = Date()
    @Published var icon = ""
    @Published var title = ""
    @Published var sumOfMoney = 0.0
    
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    @Published var showSheet = false
    
    private var listener: ListenerRegistration?
    
    
    
    // MARK: - Functions
    
    func calculateDifference(availableAmount: Double, amount: Double) -> Double {
        
        let differenceAmount = availableAmount - amount
        
        return differenceAmount
    }
    
    
    func setSumOfMoney(amount: String) {
        
        if amount.contains(".") {
            if let value = Double(amount), !value.isNaN {
                sumOfMoney = value
            } else {
                errorDescription = "Gib bitte eine Zahl ein! \n Beispiel: 10.00"
                showAlert.toggle()
            }
        } else {
            errorDescription = "Gib bitte eine Kommazahl mit einem Punkt anstatt ein Komma ein! \n Beispiel: 10.00"
            showAlert.toggle()
        }
    }
    
    
    func toggleShowSheet() {
        
        showSheet.toggle()
    }
    
    
    func createSavingsGoal(id: String) {
        
        FirestoreRepository.createSavingsGoal(with: id, date: date, icon: icon, title: title, sumOfMoney: sumOfMoney)
    }
    
    
    func fetchSavingsGoals(with id: String) {
        
        listener = DatabaseManager.shared.database.collection("children").document(id).collection("savingsGoals")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print("Fetching savings goals failed:", error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No document!")
                    return
                }
                
                self.savingsGoalList = documents.compactMap { queryDocumentSnapshot -> SavingsGoal? in
                    try? queryDocumentSnapshot.data(as: SavingsGoal.self)
                }
            }
    }
    
    
    func removeListener() {
        
        savingsGoalList.removeAll()
        listener?.remove()
    }
    
}
