//
//  ViewController.swift
//  GenericsSwift
//
//  Created by Vinita Miranda on 5/29/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.printCharacter(["a","b","c",1,2]))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func printCharacter<T>(array : [T])
    {
        for character in array
        {
            println(character)
        }
    }
    

    
}

