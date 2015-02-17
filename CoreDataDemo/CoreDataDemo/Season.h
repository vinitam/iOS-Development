//
//  Season.h
//  CoreDataDemo
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Link;

@interface Season : NSManagedObject

@property (nonatomic, retain) NSString * caption;
@property (nonatomic, retain) NSString * league;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSNumber * numberOfTeams;
@property (nonatomic, retain) NSNumber * numberOfGames;
@property (nonatomic, retain) NSString * lastUpdated;
@property (nonatomic, retain) Link *season_link;

@end
