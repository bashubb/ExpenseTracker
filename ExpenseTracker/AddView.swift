//
//  AddView.swift
//  ExpenseTracker
//
//  Created by HubertMac on 07/10/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name  = "new expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    
    
    var body: some View {
        
        Form {
            Picker("Type", selection: $type) {
                ForEach(expenses.expenseTypes, id: \.self) {
                    Text($0)
                }
            }
            
            TextField("Amount", value: $amount, format: .currency(code: expenses.loadCurrency))
                .keyboardType(.decimalPad)
        }
        .navigationTitle($name)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    expenses.addItem(name: name, type: type, amount: amount)
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role:.cancel) {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
