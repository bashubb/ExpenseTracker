//
//  Expenses.swift
//  ExpenseTracker
//
//  Created by HubertMac on 05/10/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
        
    }
    
    init() {
        if let savadItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savadItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
