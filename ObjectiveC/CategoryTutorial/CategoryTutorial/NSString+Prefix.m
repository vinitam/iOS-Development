//
//  NSString+Prefix.m
//  CategoryTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "NSString+Prefix.h"

@implementation NSString (Prefix)


- (NSString *)addDollarPrefix
{
    return [NSString stringWithFormat:@"$ %@",self];
}

@end
