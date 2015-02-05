//
//  ViewController.m
//  PropertiesTutorial
//
//  Created by pn on 1/20/15.
//  Copyright (c) 2015 pn. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    Car *bmw = [[Car alloc]init];
//    bmw.isNew = YES;
    NSMutableString *model = [NSMutableString stringWithString:@"BMW 1 Series"];
    bmw.carMake = model;
    
    NSLog(@"%@", bmw.carMake);
    [model setString:@"BMW 2 Series"];
    NSLog(@"%@", bmw.carMake);
    
    Car *maruti = [[Car alloc]init];
    //    bmw.isNew = YES;
    NSMutableString *number = [NSMutableString stringWithString:@"MH 04 3276"];
    maruti.carNumber = number;
    
    NSLog(@"%@", maruti.carNumber);
    [number setString:@"MH 02 0098"];
    NSLog(@"%@", maruti.carNumber);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
