//
//  DataManager.h
//  NetworkDemo
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^NetworkSuccess)(id response);
typedef void(^NetworkFailure)(NSError *error);
@interface DataManager : NSObject
+(void)fetchDataForMatchesWithSuccess:(NetworkSuccess )success failure:(NetworkFailure)failure;

@end
