//
//  PointsViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 04.01.24.
//

import Foundation
import Combine

class PointsViewModel: ObservableObject {
    
    init() {
        
        cancellable = FirestoreRepository.shared.child
            .sink { child in
                guard let points = child?.currentPoints else { return }
                
                self.points = points
            }
    }
    
    
    // MARK: - Variables
    
    private var cancellable: AnyCancellable?
    
    @Published var points = 0
    @Published var pointsToBeRedeemed = 0
    
    @Published var inquiry = ""
    
    @Published var showRedeemSheet = false
    
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    
    // MARK: - Functions
    
    func addPoints() {
        
        points += 5
    }
    
    
    func updateCurrentPoints(with id: String) {
        
        FirestoreRepository.updateCurrentPoints(with: id, currentPoints: points)
    }
    
    
    func unlockGames() {
        
    }
    
    
    func sendInquiry(id: String) {
        
        convertStringToNumber(points: inquiry)
        
        points -= pointsToBeRedeemed
        
        updateCurrentPoints(with: id)
    }
    
    
    func toggleShowRedeemSheet() {
        
        showRedeemSheet.toggle()
    }
    
    
    func convertStringToNumber(points: String) {
        
        if let value = Int(points){
            pointsToBeRedeemed = value
        } else {
            errorDescription = "Gib bitte eine Zahl ein! \n Beispiel: 5"
            showAlert.toggle()
        }
    }
}
