//
//  DrinkCategory.swift
//  XMLParserSwift
//
//  Created by Vinita Miranda on 5/18/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import Foundation
import CoreData
class DrinkCategory: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var category_drink: Drinks

}
