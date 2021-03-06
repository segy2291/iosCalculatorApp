//
//  calculation.swift
//  Ios Calculator
//
//  Created by Sagar patel on 2017-01-21.
//  Copyright © 2017 segy. All rights reserved.
//
// Sagar Ranipa (300914091)
import Foundation


class calculation
{
    
    private var accumulator = 0.0
    
    
    
    func setOperand(operand: Double){
        
        accumulator = operand
    }
    
    
    var operations: Dictionary<String,Operation>= [
    
        "π" : Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "c": Operation.Constant(0.0),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation({ $0 * $1}),
        "÷" : Operation.BinaryOperation({ $0 / $1}),
        "+" : Operation.BinaryOperation({ $0 + $1}),
        "−" : Operation.BinaryOperation({ $0 - $1}),
        "=" : Operation.Equals
    ]
    
    enum Operation {
    
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation ((Double,Double)-> Double)
        case Equals 
        
    
    }
    // perform the different operations
    func performOperation (symbol: String){
        
       
        
        if let Operation = operations[symbol]{
            switch Operation{
            case .Constant(let Value): accumulator = Value
            case .UnaryOperation(let foo): accumulator = foo(accumulator)
            case .BinaryOperation (let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
                
            case .Equals :
                executePendingBinaryOperation()
                
            }
        }
        
            }
    private func executePendingBinaryOperation()
    {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending = nil
        }
    }

    
    
    
    private var pending: PendingBinaryOperationInfo?
    
   private struct PendingBinaryOperationInfo {
        var binaryFunction : (Double,Double)->Double
        var firstOperand : Double
    }
    

    var result :Double{
        
        get{
            return accumulator
        }
    }
    
    
    
    
}
