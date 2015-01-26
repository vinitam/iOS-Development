//
//  ViewController.m
//  ProtocolTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"
#import "DetailedViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self performSelector:@selector(showDetailedView) withObject:nil afterDelay:5];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)showDetailedView
{
    DetailedViewController *detailedViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailedViewController"];
    detailedViewController.delegate = self;
    [self presentViewController:detailedViewController animated:YES completion:^{
        
    }];
}

- (void)viewController:(ViewController * )viewController shouldUpdateProgress:(float)progress
{
    NSLog(@"Loading ....");
}

- (void)viewController:(ViewController * )viewController progressDidComplete:(BOOL)complete
{
    NSLog(@"Yay we're done !!!");
}

- (void)viewController:(ViewController * )viewController progressIsMidWay:(BOOL)complete
{
    NSLog(@"We are half way thru !!!");
}


@end
