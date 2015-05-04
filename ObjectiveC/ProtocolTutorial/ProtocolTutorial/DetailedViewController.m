//
//  DetailedViewController.m
//  ProtocolTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "DetailedViewController.h"
#import "ViewController.h"
@interface DetailedViewController ()
@property(nonatomic)IBOutlet UIProgressView *progressSlider;
@property(nonatomic)NSTimer *timer;
@end

@implementation DetailedViewController

- (void)viewDidLoad
{
    [self startTimer];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)updateProgress
{
    self.progressSlider.progress = self.progressSlider.progress + 0.1;
    
    if(self.progressSlider.progress >= 1)
    {
        [self.delegate viewController:self progressDidComplete:YES];
        [self.timer invalidate];
    }
    else if(self.progressSlider.progress == 0.5)
    {
        [self.delegate viewController:self progressIsMidWay:YES];
    }
    [self.delegate viewController:self shouldUpdateProgress:self.progressSlider.progress];
    
}

-(void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self
                                                selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
