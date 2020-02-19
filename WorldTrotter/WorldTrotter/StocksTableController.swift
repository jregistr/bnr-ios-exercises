//
//  StocksTableController.swift
//  WorldTrotter
//
//  Created by Registre, Jeff on 2/13/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit

class StocksTableController : UITableViewController {
    var stockDb: StockDatabase!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stockDb.stocks.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "StocksTableViewCell", for: indexPath) as! StockTableViewCell
        let stock = stockDb.stocks[indexPath.row]
//        cell.textLabel?.text = stock.name
//        cell.detailTextLabel?.text = "$\(stock.valueInDollars)"
        cell.nameLabel?.text = stock.name
        cell.abbrvLabel?.text = stock.abbrv
        cell.valueLabel?.text = "\(stock.valueInDollars)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let stock = stockDb.stocks[indexPath.row]
        stockDb.sellStock(stock)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        stockDb.moveStock(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        stockDb.createNextStock()
        let lastRow = tableView.numberOfRows(inSection: 0)
        let indexPath = IndexPath(row: lastRow, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
//    @IBAction func toggleEditingMode(_ sender: UIButton) {
//        if isEditing {
//            sender.setTitle("Edit", for: .normal)
//            setEditing(false, animated: true)
//        } else {
//            sender.setTitle("Done", for: .normal)
//            setEditing(true, animated: true)
//        }
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "showStock" : 
            if let row = tableView.indexPathForSelectedRow?.row {
                let stock = stockDb.stocks[row]
                let detailedView = segue.destination as! DetailedViewController
                detailedView.stock = stock
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
