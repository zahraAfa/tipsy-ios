//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Anisa Fatimah Azzahra on 27/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var total = "0.0"
    var tip = 0.0
    var numOfPeople = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        
        setSettingsLabel()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func setSettingsLabel(){
        settingsLabel.text = "Split between \(numOfPeople) people, with \(Int(tip * 100))% tip."
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
