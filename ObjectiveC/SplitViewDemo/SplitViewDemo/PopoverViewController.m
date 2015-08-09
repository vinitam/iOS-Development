//
//  PopoverViewController.m
//  PopViewDemo
//
//  Created by Vinita Miranda on 8/9/15.
//  Copyright (c) 2015 Bombay Brew Studio. All rights reserved.
//

#import "PopoverViewController.h"

@interface PopoverViewController ()
@end

@implementation PopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)dismissPopOver:(id)sender {
    [self.popOverController dismissPopoverAnimated:YES];
}

@end
