//
//  DetailedViewController.swift
//  WorldTrotter
//
//  Created by Registre, Jeff on 2/18/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit

class DetailedViewController : UIViewController, UITextFieldDelegate {

    @IBOutlet
    var nameField: UITextField!
    @IBOutlet
    var abbrvField: UITextField!
    @IBOutlet
    var valueField: UITextField!
    @IBOutlet
    var lastUpdatedField: UILabel!

    var stock: Stock!

    let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        return dateFormatter
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = stock.name
        abbrvField.text = stock.abbrv
        valueField.text = currencyFormatter.string(from: NSNumber(value: stock.valueInDollars))

        if let lastUpdated = stock.lastUpdated {
            lastUpdatedField.text = dateFormatter.string(from: lastUpdated)
        } else {
            lastUpdatedField.text = "Last Updated Unknown"
        }
    }

    /*
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    // "Save" changes to item
    item.name = nameField.text ?? ""
    item.serialNumber = serialNumberField.text
    if let valueText = valueField.text,
        let value = numberFormatter.number(from: valueText) {
        item.valueInDollars = value.intValue
} else {
        item.valueInDollars = 0
    }
}
    */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)

        if let name = nameField.text, name.count > 0 {
            stock.name = name
        }

        if let abbrv = abbrvField.text, abbrv.count > 0 {
            stock.abbrv = abbrv
        }

        if let valueString = valueField.text, let number = currencyFormatter.number(from: valueString) {
            stock.valueInDollars = number.intValue
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
