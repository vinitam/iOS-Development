//
//  Link.h
//  CoreDataDemo
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Season;

@interface Link : NSManagedObject

@property (nonatomic, retain) NSString * fixturesLink;
@property (nonatomic, retain) NSString * leagueTableLink;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * teamLink;
@property (nonatomic, retain) Season *link_Season;

@end
