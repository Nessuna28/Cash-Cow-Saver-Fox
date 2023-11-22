//
//  ProfileView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ProfileView: View {
    
    init(fireUser: FireUser) {
        self.id = fireUser.id
        self._lastName = State(initialValue: fireUser.lastName ?? "")
        self._firstName = State(initialValue: fireUser.firstName)
        self._birthday = State(initialValue: fireUser.birthday ?? Date())
        self._domicile = State(initialValue: fireUser.domicile ?? "")
        self._children = State(initialValue: fireUser.children ?? 0)
        self._childrenAccounts = State(initialValue: fireUser.childrenAccounts ?? [])
    }
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    let id: String
    @State private var lastName: String
    @State private var firstName: String
    @State private var birthday: Date
    @State private var domicile: String
    @State private var children: Int
    @State private var childrenAccounts: [FireChild]
    
    @State var showDatePickerSheet = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(Strings.adultWoman)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: Strings.cam)
                }
                .frame(height: 100)
                
                VStack(spacing: 20) {
                    DisplayForInputFields(title: "Nachname", input: $lastName)
                    
                    DisplayForInputFields(title: "Vorname", input: $firstName)
                    
                    DatePicker("Geburtstag", selection: $birthday, displayedComponents: .date)
                    
                    Divider()
                    
                    DisplayForInputFields(title: "Wohnort", input: $domicile)
                    
                    NumberPickerView(children: $children)
                    
                    Divider()
                    
                    HStack {
                        Text("Kinderaccounts")
                        
                        Spacer()
                        
                        if profileViewModel.fireUser?.childrenAccounts?.isEmpty ?? true {
                            NavigationLink {
                                ChildAccountView()
                            } label: {
                                Image(systemName: Strings.plusIcon)
                                    .foregroundColor(.blue)
                            }
                        } else {
                            NavigationLink(destination: ChildrenListView().environmentObject(profileViewModel)) {
                                Image(systemName: Strings.arrowRight)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .padding()
            }
            
            Spacer()
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    PrimaryButtonView(title: "Abbrechen")
                }
                
                Spacer()
                
                Button {
                    profileViewModel.updateUser()
                    dismiss()
                } label: {
                    PrimaryButtonView(title: "Speichern")
                }
            }
            .navigationTitle("Profil")
            .padding(.horizontal)
            .padding(.vertical, 30)
            
        }
        
    }
    
    // MARK: - Functions
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
}

#Preview {
    ProfileView(fireUser: ProfileViewModel().fireUser ?? FireUser(id: "", email: "", firstName: "", registeredAt: Date()))
        .environmentObject(ProfileViewModel())
}
