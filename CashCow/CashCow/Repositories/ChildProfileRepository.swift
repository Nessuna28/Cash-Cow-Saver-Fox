//
//  ChildProfileRepository.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import Foundation

class ChildProfileRepository {
    
    static func createChild(with id: String, familyMember: String, lastName: String, firstName: String, birthday: Date, loginName: String, loginImage: String) {
        
        let child = FireChild(parentsId: id, familyMember: familyMember, lastName: lastName, firstName: firstName, birthday: birthday, loginName: loginName, loginImage: loginImage, registeredAt: Date())
        
        do {
            try AuthManager.shared.database.collection("children").document(loginName).setData(from: child)
        } catch {
            print("Saving child failed:", error)
        }
    }
    
    
    static func updateChild(with loginName: String) {
        
        let data = ["loginName": loginName]
        
        AuthManager.shared.database.collection("children").document(loginName).setData(data, merge: true) { error in
            if let error {
                print("Update child failed:", error)
                return
            }
        }
    }
    
    
    static func fetchChild(with loginName: String, completion: @escaping (FireChild?) -> Void) {
        
        AuthManager.shared.database.collection("children").document(loginName).getDocument { document, error in
            if let error {
                print("Fetching child failed:", error)
                completion(nil)
                return
            }
            
            guard let document else {
                print("No document!")
                completion(nil)
                return
            }
            
            do {
                let child = try document.data(as: FireChild.self)
                completion(child)
            } catch {
                print("Document is not a child", error)
            }
        }
    }
    
    
    static func deleteChild(with loginName: String) {
        
        AuthManager.shared.database.collection("children").document(loginName).delete() { error in
            if let error {
                print("Delete child failed:", error)
                return
            }
        }
    }
}
