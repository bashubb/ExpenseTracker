//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by HubertMac on 05/10/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
