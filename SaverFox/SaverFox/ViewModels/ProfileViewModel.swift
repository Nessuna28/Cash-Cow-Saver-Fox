//
//  ProfileViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import UIKit


class ProfileViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var child = Child(id: "", lastName: "Fleischer", firstName: "Chris", birthday: Date(), loginName: "chris", loginImage: "affe")
    @Published var profilePicture = UIImage(named: "chris")
}
