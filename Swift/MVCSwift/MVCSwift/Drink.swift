//
//  Drink.swift
//  MVCSwift
//
//  Created by Vinita Miranda on 5/13/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import Foundation
import CoreData
@objc(Drink)
class Drink: NSManagedObject {

    @NSManaged var category: String
    @NSManaged var ingredients: String
    @NSManaged var instructions: String
    @NSManaged var name: String

}
