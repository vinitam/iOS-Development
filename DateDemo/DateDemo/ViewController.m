//
//  ViewController.m
//  DateDemo
//
//  Created by Vinita Miranda on 2/23/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic)IBOutlet UITextField *formatted3Label;
@property(nonatomic)IBOutlet UITextField *formatted1Label;
@property(nonatomic)IBOutlet UITextField *formatted2Label;

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

-(IBAction)displayTodaysDate:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    self.formatted3Label.text = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    self.formatted1Label.text = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm:ss"];
    self.formatted2Label.text = [dateFormatter stringFromDate:[NSDate date]];
    
}

@end
