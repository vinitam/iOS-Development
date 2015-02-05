//
//  Car.h
//  PropertiesTutorial
//
//  Created by Vinita Miranda on 2/5/15.
//  Copyright (c) 2015 pn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface Car : NSObject
@property(nonatomic)NSString *carName;
@property(nonatomic,copy)NSString *carMake;
@property(nonatomic,assign)NSString *carNumber;
@property(nonatomic)Person *person;
@property (nonatomic,readonly) BOOL isNew;

@end
