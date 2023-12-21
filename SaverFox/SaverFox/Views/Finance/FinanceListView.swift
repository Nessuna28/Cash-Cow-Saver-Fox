//
//  FinanceListView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct FinanceListView: View {
    
    var body: some View {
        ScrollView {
            ForEach(finance.sorted(by: { $0.date > $1.date })) { finance in
                HStack {
                    Image(finance.icon)
                        .padding(5)
                        .background(Colors.primaryOrange)
                        .clipShape(Circle())
                    
                    Text(finance.title)
                    
                    Spacer()
                    
                    Text(String(format: "%.2f €", finance.sumOfMoney))
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Colors.secondaryOrange, lineWidth: 1)
                )
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    
    // MARK: - Variables
    
    let finance: [Finance]
    
}

#Preview {
    FinanceListView(finance: FinanceViewModel().revenue)
}
