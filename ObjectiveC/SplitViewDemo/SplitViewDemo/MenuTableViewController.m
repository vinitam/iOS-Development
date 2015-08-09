//
//  MenuTableViewController.m
//  SpliVC
//
//  Created by Vinita Miranda on 8/9/15.
//  Copyright (c) 2015 Bombay Brew Studio. All rights reserved.
//

#import "MenuTableViewController.h"
#import "ViewController.h"
@interface MenuTableViewController ()
@property(nonatomic)NSArray *breakfastItems;
@property(nonatomic)ViewController *detailViewController;
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.breakfastItems = [NSArray arrayWithObjects:@"Tea", @"Coffee",@"Corn flakes",nil];

    self.detailViewController = (ViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.breakfastItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    

    cell.textLabel.text = self.breakfastItems[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.detailViewController updateLabelWithTitle:self.breakfastItems[indexPath.row]];
}



@end
