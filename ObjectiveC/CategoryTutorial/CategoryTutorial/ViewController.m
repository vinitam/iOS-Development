//
//  ViewController.m
//  CategoryTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Prefix.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSString *costString = @"500";
    
    NSLog(@"%@",[costString addDollarPrefix]);
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
