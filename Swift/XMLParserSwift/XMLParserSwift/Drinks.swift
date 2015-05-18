//
//  Drinks.swift
//  XMLParserSwift
//
//  Created by Vinita Miranda on 5/18/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import Foundation
import CoreData

class Drinks: NSManagedObject {

    @NSManaged var ingredients: String
    @NSManaged var instructions: String
    @NSManaged var name: String
    @NSManaged var drink_category: DrinkCategory

}
