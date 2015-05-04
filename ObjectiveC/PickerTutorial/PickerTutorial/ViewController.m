//
//  ViewController.m
//  PickerTutorial
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
    self.pickerElements = [[NSArray alloc]initWithObjects:@"iPhone", @"iPad",@"Nexus", nil];
    
    self.outputField = [[UITextField alloc]initWithFrame: CGRectMake(10, 100, 300, 30)];
    self.outputField.borderStyle = UITextBorderStyleRoundedRect;
    self.outputField.textAlignment = NSTextAlignmentCenter;
    self.outputField.delegate = self;
    [self.outputField setPlaceholder:@"Pick your favorite phone"];
    [self.view addSubview:self.outputField];
    
    self.pickerView = [[UIPickerView alloc]init];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(doneButtonClicked:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     self.pickerView.frame.size.height-50, 320, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects: doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.outputField.inputView = self.pickerView;
    self.outputField.inputAccessoryView = toolBar;
    
}

#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerElements count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.outputField.text = [self.pickerElements objectAtIndex:row];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerElements objectAtIndex:row];
}

-(void)doneButtonClicked:(id)Sender
{
    [self.outputField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
