//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Registre, Jeff on 2/12/20.
//  Copyright © 2020 Registre, Jeff. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet
    var farenInputField: UITextField!
    @IBOutlet
    var celciusValueLabel: UILabel!
    
    var fahrenheitValue: Measurement<UnitTemperature>? = Measurement(value: 30, unit: .fahrenheit)
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Temperature View Did Load bruh")
        
        // Do any additional setup after loading the view.
//        let firstViewRec = CGRect(x: 160, y: 240, width: 100, height: 150)
//        let firstView = UIView(frame: firstViewRec)
//        firstView.backgroundColor = UIColor.blue
//        view.addSubview(firstView)
//
//        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
//        let secondView = UIView(frame: secondFrame)
//        secondView.backgroundColor = UIColor.green
//        firstView.addSubview(secondView)
        if let fahrenheitValue = fahrenheitValue,
            let stringValue = numberFormatter.string(from: NSNumber(value: fahrenheitValue.value)) {
            farenInputField.text = stringValue
        }
        
        updateCelciusLabel()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
       farenInputField.resignFirstResponder()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let textValue = textField.text, let number = numberFormatter.number(from: textValue)?.doubleValue {
            fahrenheitValue = Measurement(value: number, unit: .fahrenheit)
            updateCelciusLabel()
        } else {
            fahrenheitValue = nil
        }
    }
    
    func updateCelciusLabel() {
        if let celciusValue = celciusValue {
            let string = numberFormatter.string(from: NSNumber(value: celciusValue.value))
            celciusValueLabel.text = string
        } else {
            celciusValueLabel.text = "???"
        }
    }
    
    // Overriding from Protocol UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maybeText = textField.text
        let maybeTextLength = maybeText?.count
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        
        if(string.count != 0 && maybeTextLength != nil && maybeTextLength! >= 4) {
            return false
        }
        
        if maybeText?.range(of: decimalSeparator) != nil,
            string.range(of: decimalSeparator) != nil {
            return false
        }
        return true
    }
    
}

