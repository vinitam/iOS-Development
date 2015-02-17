//
//  ViewController.m
//  ScrollViewTutorial
//
//  Created by Vinita Miranda on 1/24/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self addScrollView];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    for(int i=0 ;i < 3;i++)
    {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height) ];
                                
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"landscape%i",i+1]];
        [self.scrollView addSubview:imgView];
    }
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 3;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2,
                                          self.view.frame.size.height);
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    self.scrollView.pagingEnabled = YES;
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did end decelerating");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    NSLog(@"Did scroll");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    NSLog(@"Did end dragging");
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did begin decelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"Did begin dragging");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
