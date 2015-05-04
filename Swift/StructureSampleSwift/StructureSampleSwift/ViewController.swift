//
//  ViewController.swift
//  StructureSampleSwift
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit


struct User
{
    var name : String
    var age : Int
    
    func getUserInfo() -> String
    {
        return "\(name) is \(age) years old"
    }
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var userInfo = User(name: "Kate", age: 15)
        println(userInfo.getUserInfo())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

