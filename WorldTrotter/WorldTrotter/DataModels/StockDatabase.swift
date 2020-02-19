//
//  StockDatabase.swift
//  WorldTrotter
//
//  Created by Registre, Jeff on 2/13/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit

class StockDatabase {
    var stocks = [Stock]()
    
    init() {
        for _ in 0...5 {
            createNextStock()
        }
    }

    let archiveUrl: URL = {
        let docsDirs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = docsDirs.first!
        return docDir.appendingPathComponent("stocks.plist")
    }()
}

extension StockDatabase {
    func sellStock(_ stock: Stock) {
        if let index = stocks.firstIndex(of: stock) {
            stocks.remove(at: index)
        }
    }
    /*
     func moveItem(from fromIndex: Int, to toIndex: Int) {
         if fromIndex == toIndex {
     return }
         // Get reference to object being moved so you can reinsert it
         let movedItem = allItems[fromIndex]
         // Remove item from array
         allItems.remove(at: fromIndex)
         // Insert item in array at new location
         allItems.insert(movedItem, at: toIndex)
     }
     */
    func moveStock(from fromIndex: Int, to toIndex: Int) {
        guard fromIndex == toIndex else {
            return
        }
        
        stocks.swapAt(fromIndex, toIndex)
    }

    @discardableResult func createNextStock() -> Stock {
        let newItem = Stock(random: true)
        stocks.append(newItem)
        return newItem
    }
}


// Data persistence
extension StockDatabase {

    func saveChanges() -> Bool {
        let encoder = PropertyListEncoder()
        let maybeData = try? encoder.encode(stocks)
        return maybeData != nil
    }
}
