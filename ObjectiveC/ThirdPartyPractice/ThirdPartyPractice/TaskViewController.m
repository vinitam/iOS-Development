//
//  TaskViewController.m
//  ThirdPartyPractice
//
//  Created by Vinita Miranda on 3/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "TaskViewController.h"
#import "AppDelegate.h"
#import "Task.h"
@interface TaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (nonatomic)UIDatePicker *picker;
@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dictionary = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObject:[UIColor lightGrayColor]] forKeys:[NSArray arrayWithObject:NSForegroundColorAttributeName]];
    self.navigationController.navigationBar.titleTextAttributes = dictionary;
    
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    
    if(self.fromScreen == ENTERTASK)
    {
        [self.submitButton setTitle:@"Add Task" forState:UIControlStateNormal];
        [self.submitButton setTitle:@"Add Task"
                           forState:UIControlStateSelected];
        
        self.title = @"Enter Task";

        UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)] ;
        
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonClicked:)];
        
        UIBarButtonItem *flexiSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClicked:)];
        
        
        [toolbar setItems:[NSArray arrayWithObjects:cancelButton,flexiSpace,doneButton ,nil]];
        
        self.picker = [[UIDatePicker alloc]init];
        self.picker.datePickerMode = UIDatePickerModeDate;
        self.dateTextField.inputView = self.picker;
        self.dateTextField.inputAccessoryView = toolbar;
        self.cancelButton.hidden = YES ;
    }
    else if(self.fromScreen == CALENDARDETAIL)
    {
        [self.submitButton setTitle:@"Done" forState:UIControlStateNormal];
        [self.submitButton setTitle:@"Done" forState:UIControlStateSelected];

        self.title = @"Task Details";

        self.dateTextField.userInteractionEnabled = NO;
        self.titleTextField.userInteractionEnabled = NO;
        self.descriptionTextField.userInteractionEnabled = NO;

        self.titleTextField.text = self.task.title;
        self.descriptionTextField.text = self.task.descriptionLabel;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
        NSDate *originalDate = [dateFormatter dateFromString:self.task.date];
        [dateFormatter setDateFormat:@"dd MMM yyyy hh:mm:ss aa"];
        self.dateTextField.text = [dateFormatter stringFromDate:originalDate];
        self.cancelButton.hidden = NO ;

    }
    UITapGestureRecognizer  *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundTapped)];
    [self.view addGestureRecognizer:tapGesture];
    
}

-(void)cancelButtonClicked:(id)sender
{
    [self.dateTextField resignFirstResponder];
}

-(void)doneButtonClicked:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd MMM yyyy hh:mm:ss aa"];
    self.dateTextField.text = [dateFormatter stringFromDate:self.picker.date];
    [self.dateTextField resignFirstResponder];
}

-(void)backgroundTapped
{
    [self.titleTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    [self.dateTextField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    if(self.fromScreen == ENTERTASK)
    {
        return YES;
    }
    else if(self.fromScreen == CALENDARDETAIL)
    {
        return NO;

    }
    return NO;
}

- (IBAction)addTaskClicked:(id)sender
{
    if(self.fromScreen == ENTERTASK)
    {
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        if(self.titleTextField.text.length > 0 && self.descriptionTextField.text.length > 0 && self.dateTextField.text.length > 0)
        {
            Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:appDelegate.managedObjectContext];
            task.title = self.titleTextField.text;
            task.descriptionLabel = self.descriptionTextField.text;
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"dd MMM yyyy hh:mm:ss aa"];
            NSDate *originalDate = [dateFormatter dateFromString:self.dateTextField.text];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
            NSString *formattedString = [dateFormatter stringFromDate:originalDate];
            
            
            task.date = formattedString;
            [appDelegate.managedObjectContext save:nil];
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Task Saved" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TaskAdded" object:nil];
            
            [self registerForLocalNotification];
        }

    }
    else if(self.fromScreen == CALENDARDETAIL)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)registerForLocalNotification
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd MMM yyyy hh:mm:ss aa"];
    NSDate *originalDate = [dateFormatter dateFromString:self.dateTextField.text];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    NSString *formattedString = [dateFormatter stringFromDate:originalDate];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = [dateFormatter dateFromString:formattedString];
    localNotification.alertBody = self.titleTextField.text;
    localNotification.timeZone =[NSTimeZone systemTimeZone];
    [[UIApplication  sharedApplication]scheduleLocalNotification:localNotification];
    
}


-(IBAction)cancelTaskClicked:(id)sender
{
    NSArray *notifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    UILocalNotification *localNotification;
    
    if([notifications count] > 0)
    {
        for(int i=0;i < [notifications count];i++)
        {
            UILocalNotification *notification = [notifications objectAtIndex:i];
            
            if([notification.alertBody isEqualToString:self.task.title])
            {
                localNotification = notification;
                break;
            }
        }
        
        if(localNotification)
        {
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
        }
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Notification doesn't exist" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

@end
