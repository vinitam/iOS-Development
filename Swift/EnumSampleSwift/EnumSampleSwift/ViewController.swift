//
//  ViewController.swift
//  EnumSampleSwift
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    enum AppState : Int{
        case NotRunning,InActive,Active,Background,Suspended
        func getStateIntDescription() -> String {
            return "Current state is \(self.rawValue)"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let state = AppState.Active
        let stateDesc = state.getStateIntDescription()
        println(stateDesc)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

