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
            
            Text(Strings.welcomeBack)
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
            Alert(title: Text(Strings.error),
                  message: Text(biometryViewModel.errorDescription ?? Strings.authenticationFailed),
                  dismissButton: .default(Text(Strings.okay))
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
