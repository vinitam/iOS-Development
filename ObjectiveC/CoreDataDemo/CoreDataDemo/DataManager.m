//
//  DataManager.m
//  NetworkDemo
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "DataManager.h"
#import "Season+Operation.h"
@implementation DataManager

+(void)fetchDataForMatchesWithSuccess:(NetworkSuccess )success failure:(NetworkFailure)failure
{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"http://api.football-data.org/alpha/soccerseasons"]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                if (error) {
                    failure(error);
                } else {
                    success([Season getSeasonFromDictionary:[NSJSONSerialization JSONObjectWithData:data
                                                                                            options:kNilOptions
                                                                                              error:&error]]);
                }
            }] resume];
    
//    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.football-data.org/alpha/soccerseasons"]] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//        
//        if (error) {
//            failure(error);
//        } else {
//            success([Season getSeasonFromDictionary:[NSJSONSerialization JSONObjectWithData:data
//                                options:kNilOptions
//                                  error:&error]]);
//        }
//    }];
    
}


@end
