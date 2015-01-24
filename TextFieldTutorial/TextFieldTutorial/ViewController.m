//
//  ViewController.m
//  TextFieldTutorial
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
    [self setUpTextField];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpTextField
{
    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    prefixLabel.text =@"$";
    [prefixLabel sizeToFit];
    
    // This sets the border style of the text field
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    // This sets the alignment of the text field
    self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    //Placeholder text is displayed when no text is typed
    self.textField.placeholder = @"Enter your message";
    
    //Prefix label is set as left view and the text starts after that
    self.textField.leftView = prefixLabel;
  
    //It set when the left prefixLabel to be displayed
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    
    // sets the delegate to the current class
    self.textField.delegate = self;
    
}


// pragma mark is used for easy access of code in Xcode
#pragma mark - TextField Delegates

// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
