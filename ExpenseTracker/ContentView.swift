//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by HubertMac on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpenxe = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.expenseTypes, id: \.self) {type in
                    
                    Section(type){
                        ForEach(expenses.items) { item in
                            if item.type == type {
                                HStack {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Text(item.amount, format: .currency(code: expenses.loadCurrency))
                                        .foregroundStyle(item.amount < 10 ? Color.green : (item.amount < 100 ? Color.orange : Color.red))
                                }
                            }
                        }
                        .onDelete(perform: expenses.removeItems)
                    }
                    
                }
                
            }
            .navigationTitle("Expense Tracker")
            .toolbar{
                Button{
                    showingAddExpenxe = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpenxe){
            AddView(expenses: expenses)
        }
    }
}

#Preview {
    ContentView()
}
