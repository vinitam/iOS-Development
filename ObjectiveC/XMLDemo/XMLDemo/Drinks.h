//
//  Drinks.h
//  DrinksRecipe
//
//  Created by Vinita Miranda on 2/18/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class DrinkCategory;

@interface Drinks : NSManagedObject

@property (nonatomic, retain) NSString * ingredients;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * instructions;
@property (nonatomic, retain) DrinkCategory *drink_category;

@end
