//
//  DataHelper.m
//  SQLiteTutorial
//
//  Created by Vinita Miranda on 2/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "DataHelper.h"

@implementation DataHelper

+ (instancetype)sharedDataHelper {
    static DataHelper *_sharedDataHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        _sharedDataHelper =  [[[self class] alloc] init];
    });
    
    return _sharedDataHelper;
}

-(NSArray *)fetchAllIssues
{
    
}

@end
