//
//  ViewController.m
//  PropertiesTutorial
//
//  Created by pn on 1/20/15.
//  Copyright (c) 2015 pn. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    self.titleLabel.text = @"Hello";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonClicked:(id)sender
{
    self.subTitleLabel.text = @"World";
}

@end
