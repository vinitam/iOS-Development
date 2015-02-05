//
//  ViewController.m
//  SQLiteTutorial
//
//  Created by Vinita Miranda on 2/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "RegisterViewController.h"
#import "Issue.h"
@interface RegisterViewController ()
@property(nonatomic)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *issueArray;
@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [self fetchAllIssues];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.issueArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Issue *issue = [self.issueArray objectAtIndex:indexPath.row];
    cell.textLabel.text = issue.name;
    cell.detailTextLabel.text = issue.issue;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
