//
//  DataHelper.h
//  SQLiteTutorial
//
//  Created by Vinita Miranda on 2/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DataHelper : NSObject
{
    NSString *databasePath;
}
+(DataHelper*)sharedInstance;
-(NSArray *)fetchAllissues;
-(BOOL)createDB;
-(BOOL)createIssueWithName:(NSString*)issueName issueDescription:(NSString*)description;
@end
