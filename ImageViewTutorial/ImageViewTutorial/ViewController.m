//
//  ViewController.m
//  ImageViewTutorial
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)buttonChangeImageClicked:(id)sender
{
    self.imageView.image = [UIImage imageNamed:@"surprise"];
    [self.button setTitle:@"Finally !!!" forState:UIControlStateNormal];
    [self.button setTitle:@"Finally !!!" forState:UIControlStateSelected];
    
}


@end
