//
//  ViewController.swift
//  FunctionsAsParameter
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("Sum \(computeResult(calculateSum, inputArray: [Double(10),Double(2),Double(3)]))")

        println("Average \(computeResult(calculateAverage, inputArray: [Double(10),Double(2),Double(3)]))")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func computeResult(inputFunction : [Double] -> Double, inputArray : [Double]) -> Double
    {
        return inputFunction(inputArray)
    }

    
    func calculateSum(inputArray : [Double]) -> Double
    {
        var sum : Double = 0
        
        for number in inputArray
        {
            sum = sum + number
        }
        return sum
    }
    
    func calculateAverage(inputArray : [Double]) -> Double
    {
        var sum : Double = 0
        
        for number in inputArray
        {
            sum = sum + number
        }
        
        var result: Double = Double(sum) / Double(inputArray.count)
        
        return result
    }
    
}

