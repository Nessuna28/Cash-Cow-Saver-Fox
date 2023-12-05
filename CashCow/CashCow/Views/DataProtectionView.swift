//
//  DataProtectionView.swift
//  CashCow
//
//  Created by Angelique Freier on 05.12.23.
//

import SwiftUI

struct DataProtectionView: View {
    
    var body: some View {
        ScrollView {
            ForEach(1..<10) { index in
                Image("datenschutz\(index)")
                    .resizable()
                    .scaledToFill()
            }
        }
        .navigationTitle(Strings.dataProtection)
    }
    
}

#Preview {
    DataProtectionView()
}
