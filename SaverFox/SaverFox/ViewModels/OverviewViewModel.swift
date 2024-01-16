//
//  OverviewViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 05.01.24.
//

import Foundation
import Combine

class OverviewViewModel: ObservableObject {
    
    init() {
        
        cancellable = FirestoreRepository.shared.child
            .sink { child in
                
                self.setEmoji(points: child?.currentPoints ?? 0)
            }
    }
    
    // MARK: - Variables
    
    private var cancellable: AnyCancellable?
    
    @Published var emoji = ""
    
    
    // MARK: - Functions
    
    func setEmoji(points: Int) {
        
        if points >= 60 {
            emoji = "😃"
        } else if points >= 30 {
            emoji = "🙂"
        } else if points >= 10 {
            emoji = "😐"
        } else if points >= 5 {
            emoji = "😞"
        } else {
            emoji = "😢"
        }
    }
    
}
