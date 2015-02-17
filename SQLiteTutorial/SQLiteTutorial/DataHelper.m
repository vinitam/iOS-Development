//
//  DataHelper.m
//  SQLiteTutorial
//
//  Created by Vinita Miranda on 2/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "DataHelper.h"
#import "Issue.h"
static DataHelper *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DataHelper

+(DataHelper*)sharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"issues.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS issueDetail (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ISSUE TEXT)";
            
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                return NO;
            }
            sqlite3_close(database);
            return YES;

        }
        else
        {
            return NO;
        }
    }
    return NO;

}



-(BOOL)createIssueWithName:(NSString*)issueName issueDescription:(NSString*)description
{
    sqlite3_stmt    *statement;

    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into issueDetail (NAME, ISSUE) values (\"%@\", \"%@\")",issueName,description];
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        } else {
            return NO;

        }
    }
    return NO;
}

-(NSArray *)fetchAllissues
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = @"select * from issueDetail";
        
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                Issue *issue = [[Issue alloc]init];
                
//                issue.issueNumber =  sqlite3_column_int(statement, 0);
                issue.name = [[NSString alloc] initWithUTF8String:
                              (const char *) sqlite3_column_text(statement, 0)];
                issue.issue = [[NSString alloc] initWithUTF8String:
                              (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:issue];
                return resultArray;
            }
            else{
                NSLog(@"Not found");
                return nil;
            }
        }
        sqlite3_reset(statement);
    }
    return nil;
}

@end