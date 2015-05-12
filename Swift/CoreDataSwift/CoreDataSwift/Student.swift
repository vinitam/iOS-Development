//
//  Student.swift
//  CoreDataSwift
//
//  Created by Vinita Miranda on 5/11/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import Foundation
import CoreData
@objc(Student)

class Student: NSManagedObject {

    @NSManaged var studentName: String
    @NSManaged var age: NSNumber
    @NSManaged var student_teacher: NSSet
    @NSManaged var student_class: Class

}
