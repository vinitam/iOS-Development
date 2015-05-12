//
//  Class.swift
//  CoreDataSwift
//
//  Created by Vinita Miranda on 5/11/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import Foundation
import CoreData
@objc(Class)

class Class: NSManagedObject {

    @NSManaged var standard: String
    @NSManaged var name: String
    @NSManaged var class_student: NSSet
    @NSManaged var class_teacher: NSSet

}
