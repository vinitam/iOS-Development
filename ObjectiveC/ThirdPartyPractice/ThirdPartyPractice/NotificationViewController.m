//
//  NotificationViewController.m
//  ThirdPartyPractice
//
//  Created by Vinita Miranda on 3/5/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()
@property(nonatomic)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray  *schedulenotifications;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchNotifications];
    [self.tableView reloadData];
}

-(void)fetchNotifications
{
    self.schedulenotifications = [[UIApplication sharedApplication]scheduledLocalNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{

        return YES;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.schedulenotifications count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILocalNotification *notification = [self.schedulenotifications objectAtIndex:indexPath.row];
    cell.textLabel.text = notification.alertBody;
    [cell setEditing:YES];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void) setEditing:(BOOL)editing
           animated:(BOOL)animated{
    
    [super setEditing:editing
             animated:animated];
    
    [self.tableView setEditing:editing
                        animated:animated];
    
    
}

@end
