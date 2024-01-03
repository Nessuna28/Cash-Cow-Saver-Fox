//
//  FirestoreRepository.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage
import UIKit

class FirestoreRepository {
    
    // MARK: - Child
    
    static func fetchChild(with loginName: String, completion: @escaping (Child?) -> Void) {
        
        DatabaseManager.shared.database.collection("children").whereField("loginName", isEqualTo: loginName)
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print("Fetching children failed:", error)
                    completion(nil)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No document!")
                    completion(nil)
                    return
                }
                
                let children = documents.compactMap { queryDocumentSnapshot -> Child? in
                    try? queryDocumentSnapshot.data(as: Child.self)
                }
                
                completion(children.first)
            }
    }
    
    
    static func updateLoginData(with id: String, loginName: String, loginImage: String) {
        
        let data = ["loginName": loginName, "loginImage": loginImage]
        
        DatabaseManager.shared.database.collection("children").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update login data failed:", error)
                return
            }
        }
    }
    
    
    static func updateInitialAmount(with id: String, initialAmount: Double) {
        
        let data = ["initialAmount": initialAmount]
        
        DatabaseManager.shared.database.collection("children").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update initial amount failed:", error)
                return
            }
        }
    }
    
    
    static func updateCurrentPoints(with id: String, currentPoints: Int) {
        
        let data = ["currentPoints": currentPoints]
        
        DatabaseManager.shared.database.collection("children").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update current points failed:", error)
                return
            }
        }
    }
    
    
    
    // MARK: - Finances
    
    static func createFinance(with id: String, date: Date, category: String, icon: String, fromOrFor: String, title: String, sumOfMoney: Double) {
        
        let finance = Finance(date: date, category: category, icon: icon, fromOrFor: fromOrFor, title: title, sumOfMoney: sumOfMoney)
        
        do {
            try DatabaseManager.shared.database.collection("children").document(id).collection("finances").document().setData(from: finance)
        } catch {
            print("Saving finance failed:", error)
        }
    }

    
    static func createSavingsGoal(with id: String, date: Date, icon: String, title: String, sumOfMoney: Double) {
        
        let savingsGoal = SavingsGoal(date: date, icon: icon, title: title, sumOfMoney: sumOfMoney)
        
        do {
            try DatabaseManager.shared.database.collection("children").document(id).collection("savingsGoals").document().setData(from: savingsGoal)
        } catch {
            print("Saving savings goal failed:", error)
        }
    }
    
    
    static func deleteFinance(with id: String, financeId: String) {
        
        DatabaseManager.shared.database.collection("children").document(id).collection("finances").document(financeId).delete { error in
            if let error {
                print("Delete finance failed:", error)
                return
            }
        }
    }
    
    
    static func deleteSavingsGoal(with id: String, savingsGoalId: String) {
        
        DatabaseManager.shared.database.collection("children").document(id).collection("savingsGoals").document(savingsGoalId).delete { error in
            if let error {
                print("Delete savings goal failed:", error)
                return
            }
        }
    }
    
    
    // MARK: - Photo
    
    static func uploadPhoto(with id: String, collection: String, image: UIImage?) {
        
        guard let image else {
            print("No image")
            return
        }
        
        let storageRef = Storage.storage().reference()
        
        let imageData = image.jpegData(compressionQuality: 0.8)
        
        guard let imageData else {
            print("Not convert image to data")
            return
        }
        
        let path = "images/profilePictures/\(id).jpg"
        let fileRef = storageRef.child(path)
        
        fileRef.putData(imageData, metadata: nil) { metadata, error in
            guard let metadata = metadata else {
                print("Failed to push image to Storage:")
                return
            }
            
            let fdb = Firestore.firestore()
            fdb.collection(collection).document(id).setData(["profilePicture": path], merge: true) { error in
                if let error {
                    print("Update photo failed:", error)
                    return
                }
            }
        }
    }
    
    
    static func downloadPhoto(profilePicture: String?, completion: @escaping (UIImage?) -> Void) {
        
        if let image = profilePicture {
            let storageRef = Storage.storage().reference()
            let fileRef = storageRef.child(image)
            
            fileRef.getData(maxSize: (5 * 1024 * 1024)) { data, error in
                if let error = error {
                    print("No image", error)
                    completion(UIImage(named: Strings.defaultProfilePicture))
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("Failed to convert data to UIImage.")
                    completion(UIImage(named: Strings.defaultProfilePicture))
                }
            }
        } else {
            completion(UIImage(named: Strings.defaultProfilePicture))
        }
    }
    
}
