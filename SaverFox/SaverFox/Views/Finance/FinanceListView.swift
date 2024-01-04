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
            ForEach(finances.sorted(by: { $0.date > $1.date })) { finance in
                HStack {
                    HStack {
                        Image(systemName: finance.icon)
                            .padding(5)
                            .background(Colors.primaryOrange)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(finance.fromOrFor)
                                .font(.footnote)
                            
                            Text(finance.title)
                        }
                        
                        Spacer()
                        
                        Text(String(format: "%.2f €", finance.sumOfMoney))
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Colors.secondaryOrange, lineWidth: 1)
                    )
                    
                    Button {
                        financeViewModel.deleteFinance(with: id, financeId: finance.id ?? "")
                    } label: {
                        Image(systemName: Strings.trashIcon)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    
    let finances: [Finance]
    let id: String
    
}

#Preview {
    FinanceListView(finances: [], id: "")
        .environmentObject(FinanceViewModel())
}
