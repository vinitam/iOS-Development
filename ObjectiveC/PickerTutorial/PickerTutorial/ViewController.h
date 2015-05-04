//
//  ViewController.h
//  PickerTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic)IBOutlet UITextField *outputField;
@property(nonatomic)IBOutlet UIPickerView *pickerView;
@property(nonatomic)IBOutlet NSArray *pickerElements;
@end

