//
//  TaskViewController.h
//  ThirdPartyPractice
//
//  Created by Vinita Miranda on 3/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
typedef enum
{
    ENTERTASK = 0,
    CALENDARDETAIL = 1
} FromScreen;


@interface TaskViewController : UIViewController
@property(nonatomic)FromScreen fromScreen;
@property(nonatomic)Task *task;
@end
