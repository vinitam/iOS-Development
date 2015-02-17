//
//  ViewController.m
//  SQLiteTutorial
//
//  Created by Vinita Miranda on 2/4/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "RegisterViewController.h"
#import "Issue.h"
#import "DataHelper.h"
@interface RegisterViewController ()
@property(nonatomic)IBOutlet UITextField *nameLabel;
@property(nonatomic)IBOutlet UITextView *descLabel;
@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:singleTapGestureRecognizer];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)dismissKeyboard:(id)sender
{
    [self.nameLabel resignFirstResponder];
    [self.descLabel resignFirstResponder];
}

-(IBAction)buttonCreateIssueClicked:(id)sender
{
    if(self.nameLabel.text.length > 0 && self.descLabel.text.length > 0)
    {
        [[DataHelper sharedInstance]createIssueWithName:self.nameLabel.text issueDescription:self.descLabel.text];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
