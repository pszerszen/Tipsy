//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Piotr Szerszeń on 04/10/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var data: CalculationData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let service = CalculationService(data: data!)
        
        totalLabel.text = service.getAmountPerPerson()
        settingsLabel.text = "Split between \(service.getSplit()) people, with \(service.getTip()) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

