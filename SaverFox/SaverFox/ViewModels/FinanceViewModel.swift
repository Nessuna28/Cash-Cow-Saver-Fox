//
//  FinanceViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import FirebaseFirestore
import Combine

class FinanceViewModel: ObservableObject {
    
    init() {
        
        cancellable = FirestoreRepository.shared.child
            .sink { child in
                guard let child, let id = child.id else { return }
                
                self.fetchFinances(with: id, initialAmount: child.initialAmount ?? 0.0)
            }
    }
    
    
    // MARK: - Variables
    
    private var cancellable: AnyCancellable?
    
    @Published var initialAmountAsString: String?
    @Published var initialAmount: Double?
    
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    @Published var finances: [Finance] = []
    
    @Published var date = Date()
    @Published var category = ""
    @Published var icon = ""
    @Published var fromOrFor = ""
    @Published var title = ""
    @Published var sumOfMoney = 0.0
    
    @Published var revenue = [Finance]()
    @Published var expenditure = [Finance]()
    @Published var sumRevenue = 0.00
    @Published var sumExpenditure = 0.00
    @Published var currentSum = 0.0
    
    @Published var showRevenueSheet = false
    @Published var showExpenditureSheet = false
    
    private var listener: ListenerRegistration?

    
    
    // MARK: - Functions
    
    func convertStringToNumber(amount: String, selection: String) {
        
        if amount.contains(".") {
            if let value = Double(amount), !value.isNaN {
                if selection == "init" {
                    initialAmount = value
                } else if selection == "sum" {
                    sumOfMoney = value
                }
            } else {
                errorDescription = "Gib bitte eine Zahl ein! \n Beispiel: 10.00"
                showAlert.toggle()
            }
        } else {
            errorDescription = "Gib bitte eine Kommazahl mit einem Punkt anstatt ein Komma ein! \n Beispiel: 10.00"
            showAlert.toggle()
        }
    }
    
    
    private func filterIncomeAndExpenses() {
        
        revenue = []
        expenditure = []
        sumRevenue = 0.0
        sumExpenditure = 0.0
        
        for finance in finances {
            if finance.category == "Einnahme" {
                revenue.append(finance)
                sumRevenue += finance.sumOfMoney
            } else if finance.category == "Ausgabe" {
                expenditure.append(finance)
                sumExpenditure += finance.sumOfMoney
            }
        }
    }
    
    
    private func calculateActualTotal(initialAmount: Double) {
        
        currentSum = (initialAmount + sumRevenue) - sumExpenditure
    }
    
    
    func openRevenueSheet() {
        
        showRevenueSheet.toggle()
    }
    
    
    func closeRevenueSheet() {
        
        showRevenueSheet = false
    }
    
    
    func openExpenditureSheet() {
        
        showExpenditureSheet.toggle()
    }
    
    
    func closeExpenditureSheet() {
        
        showExpenditureSheet = false
    }
    
    
    func createFinance(with id: String) {
        
        if sumOfMoney > 0 {
            FirestoreRepository.createFinance(with: id, date: date, category: category, icon: icon, fromOrFor: fromOrFor, title: title, sumOfMoney: sumOfMoney)
        }
    }
    
    
    func fetchFinances(with id: String, initialAmount: Double) {
        
        listener = DatabaseManager.shared.database.collection("children").document(id).collection("finances")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print("Fetching finances failed:", error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No document!")
                    return
                }
                
                self.finances = documents.compactMap { queryDocumentSnapshot -> Finance? in
                    try? queryDocumentSnapshot.data(as: Finance.self)
                }
                
                self.filterIncomeAndExpenses()
                self.calculateActualTotal(initialAmount: initialAmount)
            }
    }
    
    
    func deleteFinance(with id: String, financeId: String) {
        
        FirestoreRepository.deleteFinance(with: id, financeId: financeId)
    }
    
    
    func removeListener() {
        
        finances.removeAll()
        listener?.remove()
    }
}
