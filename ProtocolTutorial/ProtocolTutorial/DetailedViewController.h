//
//  DetailedViewController.h
//  ProtocolTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailedViewController;
@protocol ProgressDelegate <NSObject>
@required
- (void)viewController:(DetailedViewController * )viewController shouldUpdateProgress:(float)progress;
- (void)viewController:(DetailedViewController * )viewController progressDidComplete:(BOOL)complete;
- (void)viewController:(DetailedViewController * )viewController progressIsMidWay:(BOOL)complete;

@end

@interface DetailedViewController : UIViewController
@property(nonatomic)IBOutlet UILabel *outputLabel;
@property (retain) id <ProgressDelegate> delegate;

@end
