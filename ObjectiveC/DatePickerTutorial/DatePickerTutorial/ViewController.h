//
//  ViewController.h
//  DatePickerTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic)IBOutlet UITextField *outputField;
@property(nonatomic)IBOutlet UIDatePicker *datePicker;
@end

