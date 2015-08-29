//
//  ViewController.m
//  LocalizationDemo
//
//  Created by Vinita Miranda on 8/29/15.
//  Copyright (c) 2015 bombaybrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", NSLocalizedString(@"Hello", @"Welcome Text"));

    double moneyAmount = 1256.34;
    NSLocale *french = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSLocale *gbLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];

    NSNumberFormatter *currencyStyle = [[NSNumberFormatter alloc] init];

    [currencyStyle setLocale:gbLocale];
    [currencyStyle setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSNumber *amount = [NSNumber numberWithDouble:moneyAmount];
    NSString *amountString =  [currencyStyle stringFromNumber:amount];

    NSNumber *pAmount = [currencyStyle numberFromString:amountString]; // == 1256.34
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
