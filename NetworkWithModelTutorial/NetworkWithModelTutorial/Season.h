//
//  Season.h
//  NetworkWithModelTutorial
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Link;
@interface Season : NSObject
@property(nonatomic)NSString *caption;
@property(nonatomic)NSString *league;
@property(nonatomic)NSString *year;
@property(nonatomic)NSString *numberOfTeams;
@property(nonatomic)NSString *numberOfGames;
@property(nonatomic)NSString *lastUpdated;
@property(nonatomic)Link *link;
@end
