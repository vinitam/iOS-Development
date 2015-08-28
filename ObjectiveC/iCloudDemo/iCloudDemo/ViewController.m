//
//  ViewController.m
//  iCloudDemo
//
//  Created by Vinita Miranda on 8/29/15.
//  Copyright (c) 2015 bombaybrew. All rights reserved.
//

#import "ViewController.h"
#import <CloudKit/CloudKit.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dobTextField;
@property (weak, nonatomic) IBOutlet UITextField *employeeId;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if([self isIcloudAvailable])
    {
        NSLog(@"icloud available");
    }
    [self fetchEmployee];

}


-(void)fetchEmployee
{
    CKDatabase *publicDB = [CKContainer defaultContainer].publicCloudDatabase;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:@"Employee" predicate:predicate];
    [publicDB performQuery:query inZoneWithID:nil completionHandler:^(NSArray *results, NSError *error) {
        NSLog(@"%@",results);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addEmployee:(id)sender {
    CKDatabase *publicDB = [CKContainer defaultContainer].publicCloudDatabase;
    CKRecord *employee = [[CKRecord alloc]initWithRecordType:@"Employee"];
    [employee setObject:self.nameTextField.text forKey:@"name"];
    [employee setObject:self.dobTextField.text forKey:@"dob"];
    [employee setObject:self.employeeId.text forKey:@"employeeId"];
    [publicDB saveRecord:employee completionHandler:^(CKRecord *record, NSError *error) {

    }];
}

-(BOOL)isIcloudAvailable
{
    if([NSFileManager defaultManager].ubiquityIdentityToken)
    {
        return YES;
    }
    return NO;
}


@end
