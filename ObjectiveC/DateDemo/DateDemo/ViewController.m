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


    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    NSString *sampleString = @"23/06/2016 12:50:34";
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    NSDate *sampleDate = [dateFormatter dateFromString:sampleString];
    [dateFormatter setDateFormat:@"dd MMM yyyy hh:mm:ss a"];
    NSString *formattedString = [dateFormatter stringFromDate:sampleDate];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)displayTodaysDate:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm:ss a"];
    self.formatted3Label.text = [dateFormatter stringFromDate:[NSDate date]];
    
    
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    self.formatted1Label.text = [dateFormatter stringFromDate:[NSDate date]];
    
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm:ss"];
    self.formatted2Label.text = [dateFormatter stringFromDate:[NSDate date]];
    

    
}

@end
