//
//  ViewController.m
//  LocalizationDemo
//
//  Created by Vinita Miranda on 8/29/15.
//  Copyright (c) 2015 bombaybrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", NSLocalizedString(@"Hello", @"Welcome Text"));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
