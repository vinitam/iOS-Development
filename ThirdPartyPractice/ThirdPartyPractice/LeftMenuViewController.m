//
//  LeftMenuViewController.m
//  ThirdPartyPractice
//
//  Created by Vinita Miranda on 3/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "LeftMenuViewController.h"
#import <SlideNavigationController.h>
#import "TaskViewController.h"
#import "CalendarViewController.h"
#import "NotificationViewController.h"
@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(indexPath.row == 0)
    {
        cell.textLabel.text = @"Enter Task";
    }
    else if(indexPath.row == 1)
    {
        cell.textLabel.text = @"Display Task";
    }
    else if(indexPath.row == 2)
    {
        cell.textLabel.text = @"Show Scheduled Notifications";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    
    
    switch (indexPath.row)
    {
        case 0:
        {
            TaskViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"TaskViewController"];
            vc.fromScreen = ENTERTASK;
            [[SlideNavigationController sharedInstance]switchToViewController:vc withCompletion:^{
                
            }];
            break;
        }
        case 1:
        {
            CalendarViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"CalendarViewController"];
            [[SlideNavigationController sharedInstance]switchToViewController:vc withCompletion:^{
                
            }];

            break;
        }
        case 2:
        {
            NotificationViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"NotificationViewController"];
            [[SlideNavigationController sharedInstance]switchToViewController:vc withCompletion:^{
                
            }];
            
            break;
        }
    }
    

}


@end
