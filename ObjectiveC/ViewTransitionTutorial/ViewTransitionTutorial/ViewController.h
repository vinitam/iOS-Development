//
//  ViewController.h
//  ViewTransitionTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    kTypeCurlDown = 0,
    kTypeCurlUp,
    kTypeFlipTop,
    kTypeFlipBottom,
    kTypeFlipFromRight,
    kTypeFlipFromLeft,
    kTypeDissolve,
    kTypeNoTransition
} TransitionType;


@interface ViewController : UIViewController
{
    UIView *view1;
    UIView *view2;
}
@property(nonatomic)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *transitionType;

@end

