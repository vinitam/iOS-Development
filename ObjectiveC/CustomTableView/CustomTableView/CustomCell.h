//
//  CustomCell.h
//  CustomTableView
//
//  Created by Vinita Miranda on 2/22/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property(nonatomic)IBOutlet UILabel *itemName;
@property(nonatomic)IBOutlet UILabel *costLabel;
@property(nonatomic)IBOutlet UILabel *quantityLabel;

@end
