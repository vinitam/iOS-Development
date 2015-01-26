//
//  ViewController.m
//  DatePickerTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad
{
    [self addPickerView];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addPickerView
{
    
    self.outputField = [[UITextField alloc]initWithFrame: CGRectMake(10, 100, 300, 30)];
    self.outputField.borderStyle = UITextBorderStyleRoundedRect;
    self.outputField.textAlignment = NSTextAlignmentCenter;
    self.outputField.delegate = self;
    [self.outputField setPlaceholder:@"Pick a date"];
    [self.view addSubview:self.outputField];
    
    self.datePicker = [[UIDatePicker alloc]init];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(doneButtonClicked:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     self.datePicker.frame.size.height-50, 320, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects: doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.outputField.inputView = self.datePicker;
    self.outputField.inputAccessoryView = toolBar;
    
}



-(void)doneButtonClicked:(id)Sender
{
    NSDate *myDate = self.datePicker.date;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM d, hh:mm aa"];
    self.outputField.text = [dateFormat stringFromDate:myDate];
    
    [self.outputField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
