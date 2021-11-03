//
//  CalculationService.swift
//  Tipsy
//
//  Created by Piotr Szerszeń on 04/10/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculationService {
    
    let data: CalculationData
    
    func getAmountPerPerson() -> String{
        return String(format: "%.2f", calculate())
    }
    
    func getSplit() -> String {
        return "\(data.split)"
    }
    
    func getTip() -> String{
        return "\(data.percentage)%"
    }
    
    private func calculate() -> Float {
        let bill = data.bill
        let percentage = getFullPercentage()
        let split = Float(data.split)
        
        return bill * percentage / split
    }
    
    private func getFullPercentage() -> Float {
        var num = Float(data.percentage)
        num /= 100
        num += 1
        
        return num
    }
}
