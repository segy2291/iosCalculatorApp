//
//  ViewController.swift
//  Ios Calculator
//
//  Created by Sagar patel on 2017-01-17.
//  Copyright © 2017 segy. All rights reserved.


//Sagar Ranipa (300914091)
//Ios Calculator Assignment1

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
   
   private var userInTheMiddleOfTyping = false
    
    
    @IBAction private func touchDigit(_ sender: UIButton) {
    
    
        
    let digit = sender.currentTitle!
   // print ("touched \(digit) digit")
        
        
        if userInTheMiddleOfTyping {
    
    let textCurrentlyInDisplay = display.text!
    
    display.text = textCurrentlyInDisplay + digit
    
        } else {
        
           display.text = digit
            
        }
        
        userInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double{
    
        get{
            return Double (display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
   
    private var brain = calculation()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if userInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
             userInTheMiddleOfTyping = false
        }
       
        if let mathematicalSymbol = sender.currentTitle {
            
            brain.performOperation(symbol: mathematicalSymbol)
        
    }
        displayValue = brain.result

}

}
