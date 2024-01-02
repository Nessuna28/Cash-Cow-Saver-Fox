//
//  InputField.swift
//  SaverFox
//
//  Created by Angelique Freier on 22.12.23.
//

import SwiftUI

struct InputField: View {
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding(.trailing, 50)
                
                Spacer()
                
                Text(input)
                    .foregroundColor(Colors.primaryOrange)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
    
    
    // MARK: - Variables
    
    let title: String
    
    let input: String
    
}

#Preview {
    InputField(title: "Name", input: "Pups")
}
