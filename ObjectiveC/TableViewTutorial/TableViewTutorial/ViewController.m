//
//  ViewController.m
//  TableViewTutorial
//
//  Created by Vinita Miranda on 1/24/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // table view data is being set here
    
    self.dataDictionary = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[NSArray arrayWithObjects:@"Section 0: Row:1",@"Section 0: Row:2",@"Section 0: Row:3", nil ],[NSArray arrayWithObjects:@"Section 1: Row:1",@"Section 1: Row:2",@"Section 1: Row:3", nil ], nil] forKeys:[NSArray arrayWithObjects:@"Section 0",@"Section 1", nil]];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[self.dataDictionary  allKeys]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section
{
    NSArray *rowArray = [self.dataDictionary objectForKey:[NSString stringWithFormat:@"Section %li",(long)section]];

    return [rowArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    NSArray *rowArray = [self.dataDictionary objectForKey:[NSString stringWithFormat:@"Section %li",(long)indexPath.section]];
    [cell.textLabel setText:[rowArray objectAtIndex:indexPath.row]];
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section
{
    return  [NSString stringWithFormat:@"Section %li",(long)section];
}


@end
