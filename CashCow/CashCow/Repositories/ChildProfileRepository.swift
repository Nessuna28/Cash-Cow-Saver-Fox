//
//  ChildProfileRepository.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import Foundation

class ChildProfileRepository {
    
    static func createChild(with id: String, familyMember: String, lastName: String, firstName: String, birthday: Date, loginName: String, loginImage: String) {
        
        let parentId = AuthManager.shared.auth.currentUser?.uid ?? ""
        
        let child = FireChild(parentId: parentId, familyMember: familyMember, lastName: lastName, firstName: firstName, birthday: birthday, loginName: loginName, loginImage: loginImage, registeredAt: Date())
        
        do {
            try AuthManager.shared.database.collection("children").addDocument(from: child)
        } catch {
            print("Saving child failed:", error)
        }
    }
    
    
    static func updateChild(with id: String, familyMember: String, lastName: String, firstName: String, birthday: Date, loginName: String, loginImage: String) {
        
        let data = ["familyMember": familyMember, "lastName": lastName, "firstName": firstName, "birthday": birthday, "loginName": loginName, "loginImage": loginImage] as [String: Any]
        
        AuthManager.shared.database.collection("children").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update child failed:", error)
                return
            }
        }
    }
    
    
    static func deleteChild(with id: String) {
        
        AuthManager.shared.database.collection("children").document(id).delete { error in
            if let error {
                print("Delete child failed:", error)
                return
            }
        }
    }
}
