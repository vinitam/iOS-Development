//
//  Season+Operation.m
//  NetworkWithModelTutorial
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "Season+Operation.h"
#import "Link.h"
@implementation Season (Operation)

+(NSArray *)getSeasonFromArray:(NSArray *)seasonData
{
    NSMutableArray *resultsArray = [[NSMutableArray alloc]init];
    for(int i=0;i < [seasonData count];i++)
    {
        NSDictionary *dictionary = [seasonData objectAtIndex:i];
        
        Season *season = [[Season alloc]init];
        season.caption = [dictionary objectForKey:@"caption"];
        season.league = [dictionary objectForKey:@"league"];
        season.year = [dictionary objectForKey:@"year"];
        season.numberOfTeams = [dictionary objectForKey:@"numberOfTeams"];
        season.numberOfGames = [dictionary objectForKey:@"numberOfGames"];
        season.lastUpdated = [dictionary objectForKey:@"lastUpdated"];
        
        NSDictionary *linkDictionary = [dictionary objectForKey:@"_links"];
        Link *link = [[Link alloc]init];
        link.link = [[linkDictionary objectForKey:@"self"]objectForKey:@"href"];
        link.teamLink = [[linkDictionary objectForKey:@"teams"]objectForKey:@"href"];
        link.fixturesLink = [[linkDictionary objectForKey:@"fixtures"]objectForKey:@"href"];
        link.leagueTableLink = [[linkDictionary objectForKey:@"leagueTable"]objectForKey:@"href"];
        season.link = link;
        [resultsArray addObject:season];
    }
    return resultsArray;

}

@end
