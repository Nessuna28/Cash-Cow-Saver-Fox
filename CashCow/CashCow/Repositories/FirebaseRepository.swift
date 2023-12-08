//
//  ProfileRepository.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import UIKit

class FirebaseRepository {
    
    // MARK: - User
    
    static func createUser(with id: String, email: String, firstName: String) {
        
        let user = FireUser(id: id, email: email, firstName: firstName, registeredAt: Date())
        
        do {
            try AuthManager.shared.database.collection("users").document(id).setData(from: user)
        } catch {
            print("Saving user failed:", error)
        }
    }
    
    
    static func updateUser(with id: String, lastName: String, firstName: String, birthday: Date, domicile: String, children: Int) {
        
        let data = ["lastName": lastName, "firstName": firstName, "birthday": birthday, "domicile": domicile, "children": children] as [String: Any]
        
        AuthManager.shared.database.collection("users").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update user failed:", error)
                return
            }
        }
    }
    
    
    static func fetchUser(with id: String, completion: @escaping (FireUser?) -> Void) {
        
        AuthManager.shared.database.collection("users").document(id).getDocument { document, error in
            if let error {
                print("Fetching user failed:", error)
                completion(nil)
                return
            }
            
            guard let document else {
                print("No document!")
                completion(nil)
                return
            }
            
            do {
                let user = try document.data(as: FireUser.self)
                completion(user)
            } catch {
                print("Document is not a user", error)
            }
        }
    }
    
    
    static func deleteUser(with id: String) {
        
        AuthManager.shared.database.collection("users").document(id).delete { error in
            if let error {
                print("Delete user failed:", error)
                return
            }
        }
    }
    
    
    static func uploadPhoto(with id: String, image: UIImage?) {
        
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
        
        let path = "images/profilePictures/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        let uploadTask = fileRef.putData(imageData, metadata: nil) { metadata, error in
            guard let metadata = metadata else {
                print("Failed to push image to Storage:")
                return
            }
            
            let fdb = Firestore.firestore()
            fdb.collection("users").document(id).setData(["profilePicture": path], merge: true) { error in
                if let error {
                    print("Update photo failed:", error)
                    return
                }
            }
        }
    }
    
    
    static func downloadPhoto(with id: String, completion: @escaping (UIImage?) -> Void) {
        
        let fdb = Firestore.firestore()
        fdb.collection("users").getDocuments { snapshot, error in
            if let error {
                print("Fetching picture failed", error)
                return
            }
            
            var paths = [String]()
            
            if let snapshot = snapshot {
                for doc in snapshot.documents {
                    if let profilePicturePath = doc["profilePicture"] as? String {
                        paths.append(profilePicturePath)
                    }
                }
            }
            
            
            for path in paths {
                let storageRef = Storage.storage().reference()
                
                let fileRef = storageRef.child(path)
                
                fileRef.getData(maxSize: (1 * 1024 * 1024)) { data, error in
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
            }
        }
    }
    
    
    
    // MARK: - Child
    
    static func createChild(with id: String, familyMember: String, lastName: String, firstName: String, birthday: Date, loginName: String, loginImage: String) {
        
        if let parentId = AuthManager.shared.auth.currentUser?.uid {
            let child = FireChild(parentId: parentId, familyMember: familyMember, lastName: lastName, firstName: firstName, birthday: birthday, loginName: loginName, loginImage: loginImage, registeredAt: Date())
            
            do {
                try AuthManager.shared.database.collection("children").addDocument(from: child)
            } catch {
                print("Saving child failed:", error)
            }
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
    
    
    
    // MARK: - Settings
    
    static func createSettings(with id: String, settings: FireSettings) {
        
        let settings = FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: settings.backgroundColor, textColor: settings.textColor, userFontSize: settings.userFontSize, isDarkModeEnabled: settings.isDarkModeEnabled)
        
        do {
            try AuthManager.shared.database.collection("settings").addDocument(from: settings)
        } catch {
            print("Saving settings failed:", error)
        }
    }
    
    
    static func updateSettings(with id: String, settings: FireSettings) {
        
        let data = ["backgroundColor": settings.backgroundColor, "textColor": settings.textColor, "userFontSize": settings.userFontSize, "isDarkModeEnabled": settings.isDarkModeEnabled] as [String: Any]
        
        AuthManager.shared.database.collection("settings").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update settings failed:", error)
                return
            }
        }
    }
    
    
    static func fetchSettings(completion: @escaping (FireSettings) -> Void) {
        
        guard let userId = AuthManager.shared.auth.currentUser?.uid else { return }
        
        AuthManager.shared.database.collection("settings").document(userId).getDocument { document, error in
            if let error {
                print("Fetching settings failed:", error)
                completion(FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: UIColor(.white).colorToString(), textColor: UIColor(.black).colorToString(), userFontSize: Strings.medium, isDarkModeEnabled: false))
                return
            }
            
            guard let document else {
                print("No document!")
                completion(FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: UIColor(.white).colorToString(), textColor: UIColor(.black).colorToString(), userFontSize: Strings.medium, isDarkModeEnabled: false))
                return
            }
            
            do {
                let settings = try document.data(as: FireSettings.self)
                completion(settings)
            } catch {
                print("Document is not settings", error)
            }
        }
    }
}
