//
//  ViewController.h
//  PropertiesTutorial
//
//  Created by pn on 1/20/15.
//  Copyright (c) 2015 pn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (readwrite) int count;
@property (nonatomic,assign)BOOL isVisible;
@property(nonatomic)BOOL isRunning;
@property (nonatomic)BOOL test;
@property(nonatomic,weak)IBOutlet UILabel *titleLabel;
@property(nonatomic,weak)IBOutlet UILabel *subTitleLabel;
@property(nonatomic,weak)IBOutlet UIView *testingView;

-(IBAction)buttonClicked:(id)sender;

-(IBAction)labelTextChanged:(id)sender;
@end

