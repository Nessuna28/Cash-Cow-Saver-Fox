//
//  FamilyMemberPicker.swift
//  CashCow
//
//  Created by Angelique Freier on 23.11.23.
//

import SwiftUI

struct FamilyMemberPicker: View {
    
    var body: some View {
        HStack {
            Text("Familienmitglied")
            
            Picker("", selection: $familyMember) {
                ForEach(members, id: \.self) { member in
                    Text(member)
                }
            }
            .pickerStyle(.automatic)
            .foregroundStyle(Colors.primaryColor)
        }
    }
    
    // MARK: - Variables
    
    @State private var members = ["keine Angabe", "Sohn", "Tochter"]
    
    @Binding var familyMember: String
    
}

#Preview {
    FamilyMemberPicker(familyMember: .constant("Sohn"))
}
