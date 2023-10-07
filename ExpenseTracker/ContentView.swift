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
                ForEach(expenses.items) {item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
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
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
