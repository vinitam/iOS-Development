//
//  ViewController.m
//  SpliVC
//
//  Created by Vinita Miranda on 8/9/15.
//  Copyright (c) 2015 Bombay Brew Studio. All rights reserved.
//

#import "ViewController.h"
#import "PopoverViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic)UIPopoverController *popOverController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabelWithTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:
(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return YES;
}

- (IBAction)showPopover:(id)sender {
    PopoverViewController *popoverViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PopoverViewController"];

    self.popOverController = [[UIPopoverController alloc]initWithContentViewController:popoverViewController];
    popoverViewController.popOverController = self.popOverController;
    self.popOverController.popoverContentSize = CGSizeMake(300, 400);
    [self.popOverController presentPopoverFromRect:[(UIButton *)sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}

@end
