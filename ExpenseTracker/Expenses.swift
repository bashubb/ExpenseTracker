//
//  Expenses.swift
//  ExpenseTracker
//
//  Created by HubertMac on 05/10/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
