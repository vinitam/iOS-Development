//
//  BeerTableViewCell.h
//  BeerSample
//
//  Created by Vinita Miranda on 3/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerTableViewCell : UITableViewCell
@property(nonatomic)IBOutlet UILabel *titleLabel;
@property(nonatomic)IBOutlet UILabel *typeLabel;
@property(nonatomic)IBOutlet UILabel *ratingLabel;
@property(nonatomic)IBOutlet UIImageView *iconImageView;

@end
