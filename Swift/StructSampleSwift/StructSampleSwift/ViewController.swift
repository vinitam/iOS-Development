//
//  ViewController.swift
//  StructSampleSwift
//
//  Created by Vinita Miranda on 5/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit


struct Employee
{
    var name : String?
    var age : Int?
    var serviceline : String?
}

class Teacher
{
    var name : String?
    var age : Int?
    var serviceline : String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Structure
        var employee = Employee()
        employee.name = "Ritu"
        employee.age = 19
        employee.serviceline = "AMS"
        
        var duplicateEmployee = employee
        employee.age = 20
        
        //Class
        var teacher = Teacher()
        teacher.name = "Veena"
        teacher.age = 45
        teacher.serviceline = "SI"
        
        var duplicateTeacher = teacher
        teacher.age = 50
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

