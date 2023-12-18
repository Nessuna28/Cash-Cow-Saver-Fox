//
//  DatabaseManager.swift
//  SaverFox
//
//  Created by Angelique Freier on 18.12.23.
//

import Foundation
import Firebase
import FirebaseFirestore


class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let database = Firestore.firestore()
}
