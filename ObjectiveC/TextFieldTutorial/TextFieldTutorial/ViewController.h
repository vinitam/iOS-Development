//
//  ViewController.h
//  TextFieldTutorial
//
//  Created by Vinita Miranda on 1/24/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property(nonatomic,weak)IBOutlet  UITextField *textField;
@property(nonatomic,weak)IBOutlet  UILabel *greetingLabel;
-(IBAction)buttonClicked:(id)sender;
@end

