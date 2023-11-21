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
    
    let id: String
    @State private var lastName: String
    @State private var firstName: String
    @State private var birthday: Date
    @State private var domicile: String
    @State private var children: Int
    @State private var childrenAccounts: [FireChild]
    
    @State var showDatePickerSheet = false
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                AppIcon()
                
                SettingsButton()
            }
            .padding()
            
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
                
                Text("Profil")
                    .font(.title)
                    .padding(.top, 0)
                    .padding(.bottom, 20)
                
                
                VStack(spacing: 20) {
                    DisplayForInputFields(title: "Nachname", input: $lastName)
                    
                    DisplayForInputFields(title: "Vorname", input: $firstName)
                    
                    HStack {
                        Text("Geburtstag")
                        
                        Spacer()
                        
                        Button {
                            showDatePickerSheet.toggle()
                        } label: {
                            Text(formatDate(date: birthday))
                                .foregroundStyle(Colors.primaryColor)
                        }
                    }
                    .sheet(isPresented: $showDatePickerSheet, content: {
                        DatePickerView(birthday: $birthday, showDatePickerSheet: $showDatePickerSheet)
                    })
                    
                    Divider()
                    
                    DisplayForInputFields(title: "Wohnort", input: $domicile)
                    
                    Text("Kinder")
                    
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
                NavigationLink {
                    
                } label: {
                    PrimaryButtonView(title: "Abbrechen")
                }
                
                Spacer()
                
                Button {
                    profileViewModel.updateUser()
                } label: {
                    PrimaryButtonView(title: "Speichern")
                }
            }
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
