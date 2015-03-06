//
//  CustomComponentView.m
//  CustomViewDemo
//
//  Created by Vinita Miranda on 3/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "CustomComponentView.h"

@implementation CustomComponentView

-(void)awakeFromNib
{
    self.layer.cornerRadius = 50.0f;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 2.0;
    self.backgroundColor = [UIColor blueColor];
}

@end
