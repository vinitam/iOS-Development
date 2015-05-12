//
//  Teacher.swift
//  CoreDataSwift
//
//  Created by Vinita Miranda on 5/11/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import Foundation
import CoreData

@objc(Teacher)
class Teacher: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var subject: String
    @NSManaged var teacher_student: NSSet
    @NSManaged var teacher_class: NSSet

}
