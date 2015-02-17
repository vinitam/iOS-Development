//
//  Season+Operation.m
//  NetworkWithModelTutorial
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "Season+Operation.h"
#import "Link.h"
#import "AppDelegate.h"
@implementation Season (Operation)

+(NSArray *)getSeasonFromDictionary:(NSArray *)seasonData
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];
    for(int i=0;i < [seasonData count];i++)
    {
        NSDictionary *dictionary = [seasonData objectAtIndex:i];
        
        Season *season = [NSEntityDescription insertNewObjectForEntityForName:@"Season"        inManagedObjectContext:appDelegate.managedObjectContext];
        season.caption = [dictionary objectForKey:@"caption"];
        season.league = [dictionary objectForKey:@"league"];
        season.year = [dictionary objectForKey:@"year"];
        season.numberOfTeams = [NSNumber numberWithInt:[[dictionary objectForKey:@"numberOfTeams"]intValue]];
        season.numberOfGames = [NSNumber numberWithInt:[[dictionary objectForKey:@"numberOfGames"]intValue]];

        season.lastUpdated = [dictionary objectForKey:@"lastUpdated"];
        
        NSDictionary *linkDictionary = [dictionary objectForKey:@"_links"];
        Link *link = [NSEntityDescription insertNewObjectForEntityForName:@"Link"        inManagedObjectContext:appDelegate.managedObjectContext];
        link.link =[ [linkDictionary objectForKey:@"self"]objectForKey:@"href"];
        link.teamLink = [[linkDictionary objectForKey:@"teams"]objectForKey:@"href"];
        link.fixturesLink = [[linkDictionary objectForKey:@"fixtures"]objectForKey:@"href"];
        link.leagueTableLink = [[linkDictionary objectForKey:@"leagueTable"]objectForKey:@"href"];
        season.season_link = link;
        [resultsArray addObject:season];
    }
    [appDelegate.managedObjectContext save:nil];

    return resultsArray;
}

@end
