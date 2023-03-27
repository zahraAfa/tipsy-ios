//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var tip = 0.10
    var numberOfPeople = 2
    var total = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {

        billTextField.endEditing(true)
        
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        zeroPctButton.isSelected = false
        
        sender.isSelected = true
        
        let title = String(sender.currentTitle!.dropLast())
        
        tip = Double(title)! / 100
        
        print(tip)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = "\(numberOfPeople)"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(numberOfPeople)
        print(billTextField.text)
        
        let numOfPeople = Double(numberOfPeople)
        
        if let bill = Double(billTextField.text!) {
            total = String(format: "%.2f", (bill * (1 + tip)) / numOfPeople)
        
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResults"{
                let destinationVC = segue.destination as! ResultsViewController
                
                destinationVC.total = total
                destinationVC.tip = tip
                destinationVC.numOfPeople = numberOfPeople
            }
        }
    
}

