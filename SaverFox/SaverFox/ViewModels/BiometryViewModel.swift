//
//  BiometryViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 20.12.23.
//

import Foundation
import LocalAuthentication

class BiometryViewModel: ObservableObject {
    
    init() {
        getBiometryType()
    }
    
    
    // MARK: - Variables
    
    private(set) var context = LAContext()
    private(set) var canEvaluatePolicy = false
    
    @Published private(set) var biometryType: LABiometryType = .none
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    @Published var authenticated = false
    
    
    // MARK: - Functions
    
    func getBiometryType() {
        
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        biometryType = context.biometryType
    }
    
    
    func authenticate() {
        
        Task {
            await authenticateWithBiometrics { [unowned self] authenticated in
                DispatchQueue.main.async {
                    self.authenticated = authenticated
                }
            }
        }
    }
    
    
    private func authenticateWithBiometrics(complition: @escaping (Bool) -> Void) async {
        
        guard canEvaluatePolicy else {
            complition(false)
            return
        }
        
        do {
            let success = try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: Strings.unlockingNotPossible)
            complition(success)
        } catch {
            DispatchQueue.main.async {
                self.errorDescription = error.localizedDescription
                self.showAlert = true
            }
        }
    }
}
