//
//  Person.h
//  PropertiesTutorial
//
//  Created by Vinita Miranda on 2/5/15.
//  Copyright (c) 2015 pn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;
@interface Person : NSObject
@property(nonatomic)NSString *name;
@property(nonatomic)NSString *age;
@property(nonatomic)NSString *phoneNumber;
@property(nonatomic,weak)Car *car;
@end
