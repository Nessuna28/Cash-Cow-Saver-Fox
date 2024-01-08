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
                self.rewardClaimDate = child?.rewardClaimDate
                
                guard let points = child?.currentPoints else { return }
                
                self.points = points
            }
    }
    
    
    // MARK: - Variables
    
    private var cancellable: AnyCancellable?
    
    @Published var points = 0
    @Published var pointsToBeRedeemed = 0
    
    @Published var inquiry = ""
    @Published var rewardClaimDate: Date?
    @Published var rewardPoints = 0
    
    @Published var showRedeemSheet = false
    
    @Published var showAlert = false
    @Published var alertText = ""
    @Published var showRewardAlert = false
    
    
    // MARK: - Functions
    
    func addPoints(expenditure: [Finance]) {
        
        guard let rewardClaimDate = rewardClaimDate else { return }
        
        let expendituresInLast30Days = expenditure.filter { expenditure in
            return expenditure.date > rewardClaimDate
        }
        
        let sum = expendituresInLast30Days.reduce(0) { $0 + $1.sumOfMoney }
        let tenPoints = 10
        let fivePoints = 5
        let twoPoints = 2
        
        if sum <= 0.00 {
            points += tenPoints
            alertText = "\(Strings.wereGivenToYou) \(tenPoints) \(Strings.pointsCredited)."
            showRewardAlert.toggle()
        } else if sum <= 5.00 {
            points += fivePoints
            alertText = "\(Strings.wereGivenToYou) \(fivePoints) \(Strings.pointsCredited)."
            showRewardAlert.toggle()
        } else if sum <= 10.00 {
            points += twoPoints
            alertText = "\(Strings.wereGivenToYou) \(twoPoints) \(Strings.pointsCredited)."
            showRewardAlert.toggle()
        } else {
            alertText = ""
            showRewardAlert.toggle()
        }
    }
    
    
    func updateRewardClaimDate(with id: String) {
        
        FirestoreRepository.updateRewardClaimDate(with: id, rewardClaimDate: Date())
    }
    
    
    func updateCurrentPoints(with id: String) {
        
        FirestoreRepository.updateCurrentPoints(with: id, currentPoints: points)
    }
    
    
    func unlockGames() {
        
    }
    
    
    func sendInquiry(id: String) {
        
        convertStringToNumber(points: inquiry)
        
        if pointsToBeRedeemed <= points {
            points -= pointsToBeRedeemed
            
            updateCurrentPoints(with: id)
        } else {
            alertText = Strings.enterInt
            showAlert.toggle()
        }
        
        
    }
    
    
    func toggleShowRedeemSheet() {
        
        showRedeemSheet.toggle()
    }
    
    
    func convertStringToNumber(points: String) {
        
        if let value = Int(points) {
            pointsToBeRedeemed = value
        } else {
            alertText = Strings.notEnoughPoints
            showAlert.toggle()
        }
    }
}
