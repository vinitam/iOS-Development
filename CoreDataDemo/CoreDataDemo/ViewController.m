//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Vinita Miranda on 2/17/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//
#import "Season.h"

#import "ViewController.h"
#import "DataManager.h"
#import "AppDelegate.h"
@interface ViewController ()
@property(nonatomic)NSArray *tableData;
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchDataFromSever];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)fetchDataFromSever
{
    [DataManager fetchDataForMatchesWithSuccess:^(id response) {
        self.tableData = [self fetchSeasonData];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

-(NSArray * )fetchSeasonData
{
    AppDelegate  *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Season"];

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Season" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setReturnsDistinctResults:YES];
    
    NSError *error = nil;
    NSArray *result = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    return result;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Season *season = [self.tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = season.caption;
    return cell;
}

@end

