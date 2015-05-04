//
//  DrinkCategory.h
//  XMLDemo
//
//  Created by Vinita Miranda on 2/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Drinks;

@interface DrinkCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Drinks *category_drink;

@end
