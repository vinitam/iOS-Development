//
//  ViewController.m
//  TootlbarTutorial
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
    [self addToolbar];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)addToolbar
{
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                  target:nil action:nil];
    
    UIBarButtonItem *customItem1 = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Item 1" style:UIBarButtonItemStylePlain
                                    target:self action:@selector(toolBarItem1Clicked:)];
    
    UIBarButtonItem *customItem2 = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Item 2" style:UIBarButtonItemStyleDone
                                    target:self action:@selector(toolBarItem2Clicked:)];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             customItem1,spaceItem, customItem2, nil];
    
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    [self.view addSubview:toolbar];
    [toolbar setItems:toolbarItems];
}

-(IBAction)toolBarItem1Clicked:(id)sender
{
    [self.outputLabel setText:@"Tool 1 Selected"];
}

-(IBAction)toolBarItem2Clicked:(id)sender
{
    [self.outputLabel setText:@"Tool 2 Selected"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
