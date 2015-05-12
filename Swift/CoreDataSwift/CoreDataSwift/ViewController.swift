//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by Vinita Miranda on 5/11/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        
        var teacher = NSEntityDescription.insertNewObjectForEntityForName("Teacher",
            inManagedObjectContext: appDelegate.managedObjectContext!) as! Teacher
        
        
        
        teacher.name = "Priti"
        teacher.subject = "English"
        
        var student1 : Student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: appDelegate.managedObjectContext!) as! Student
        student1.studentName = "Ravi"
        student1.age = 15
     
        var student2 : Student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: appDelegate.managedObjectContext!) as! Student
        student2.studentName = "Reeta"
        student2.age = 20
        teacher.teacher_student = NSSet(array: [student1,student2])
        student1.student_teacher = NSSet(array: [teacher])
        student2.student_teacher = NSSet(array: [teacher])
        
        appDelegate.managedObjectContext!.save(nil)

        
        let studentFetchRequest = NSFetchRequest(entityName: "Student")
        if let studentFetchResults = appDelegate.managedObjectContext!.executeFetchRequest(studentFetchRequest, error: nil) as? [Student]
        {
            
        }
    
        let teacherFetchRequest = NSFetchRequest(entityName: "Teacher")
        if let teacherFetchResults = appDelegate.managedObjectContext!.executeFetchRequest(teacherFetchRequest, error: nil) as? [Teacher]
        {
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

