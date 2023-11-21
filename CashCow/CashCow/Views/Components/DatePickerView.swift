//
//  DatePickerView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct DatePickerView: View {
    
    // MARK: - Variables
    
    @Binding var birthday: Date
    @Binding var showDatePickerSheet: Bool
    
    var body: some View {
        Form {
            Section {
                DatePicker("Geburtstag", selection: $birthday, displayedComponents: .date)
            }
            
            Section {
                Button(action: closeSheet) {
                    TextButtonView(title: "Speichern")
                }
            }
        }
    }
    
    // MARK: - Functions
    
    private func closeSheet() {
        showDatePickerSheet = false
    }
    
}

#Preview {
    DatePickerView(birthday: .constant(Date()), showDatePickerSheet: .constant(true))
}
