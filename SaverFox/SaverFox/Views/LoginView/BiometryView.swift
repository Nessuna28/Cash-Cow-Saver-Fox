//
//  BiometryView.swift
//  SaverFox
//
//  Created by Angelique Freier on 20.12.23.
//

import SwiftUI

struct BiometryView: View {
    
    var body: some View {
        VStack {
            Image(Strings.appImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Willkommen zurück")
                .font(.title)
            
            Text(profileViewModel.child?.firstName ?? Strings.guest)
                .font(.title)
            
            Text("👋")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            Button(action: biometryViewModel.authenticate) {
                Image(systemName: biometryViewModel.biometryType == .touchID ? "touchid" : "faceid")
            }
            .font(.largeTitle)
            .foregroundStyle(Colors.textColor)
            .padding(16)
            .background(Color(Colors.primaryOrange))
            .clipShape(Circle())
            .buttonStyle(.plain)
        }
        .padding(48)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Colors.secondaryOrange))
        .alert(isPresented: $biometryViewModel.showAlert) {
            Alert(title: Text("Fehler"),
                  message: Text(biometryViewModel.errorDescription ?? "Die Authentifizierung hat nicht geklappt."),
                  dismissButton: .default(Text("Okay"))
            )
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var biometryViewModel: BiometryViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
}

#Preview {
    BiometryView()
        .environmentObject(BiometryViewModel())
        .environmentObject(ProfileViewModel())
}
