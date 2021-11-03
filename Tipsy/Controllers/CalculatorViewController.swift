//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    private var ButtonsArr = [(btn:UIButton,val:Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ButtonsArr.append((btn: zeroPctButton, val: 0))
        ButtonsArr.append((btn: tenPctButton, val: 10))
        ButtonsArr.append((btn: twentyPctButton, val: 20))
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        ButtonsArr.forEach{ b in
            b.btn.isSelected = b.btn == sender
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destincationVC = segue.destination as! ResultsViewController
            destincationVC.data = collectData()
        }
    }
    
    private func collectData() -> CalculationData {
        return CalculationData(bill: Float(billTextField.text ?? "0.0") ?? 0.0,
                              percentage: ButtonsArr.first(where: {$0.btn.isSelected})!.val,
                              split: Int(splitNumberLabel.text ?? "2") ?? 2)
    }
}

