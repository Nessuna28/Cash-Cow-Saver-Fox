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
            Text(Strings.familyMember)
            
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
    
    @State private var members = [Strings.notSpecified, Strings.son, Strings.daughter]
    
    @Binding var familyMember: String
    
}

#Preview {
    FamilyMemberPicker(familyMember: .constant(Strings.son))
}
