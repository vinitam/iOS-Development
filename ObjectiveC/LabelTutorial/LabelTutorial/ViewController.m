//
//  ViewController.m
//  LabelTutorial
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

-(IBAction)buttonClicked:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if(button.tag == 0)
    {
        self.label.numberOfLines = 2;
        self.label.text = @"This is a sample text\n of multiple lines.";
    }
    else if(button.tag == 1)
    {
        self.label.textColor = [UIColor redColor];
    }
    else if(button.tag == 2)
    {
        self.label.backgroundColor = [UIColor lightGrayColor];
    }
    else if(button.tag == 3)
    {
        self.label.textAlignment = NSTextAlignmentLeft;
    }
}

@end
