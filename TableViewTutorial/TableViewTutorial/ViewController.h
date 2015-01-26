//
//  ViewController.h
//  TableViewTutorial
//
//  Created by Vinita Miranda on 1/24/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate>
@property(nonatomic)IBOutlet UITableView *myTableView;
@property(nonatomic)NSDictionary *dataDictionary;

@end

