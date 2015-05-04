//
//  ViewController.m
//  VideoDemo
//
//  Created by Vinita Miranda on 2/23/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController ()
@property(nonatomic)MPMoviePlayerController *moviePlayerController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Uncomment for playing from local file
    NSString *thePath =[[NSBundle mainBundle] pathForResource:@"lego" ofType:@"mp4"];
//    NSURL *fileURL = [NSURL fileURLWithPath:thePath];
    
    //Comment for playing from local file
    NSURL *fileURL = [NSURL URLWithString:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];
    self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [self.moviePlayerController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self.view addSubview:self.moviePlayerController.view];
    self.moviePlayerController.fullscreen = YES;
    [self.moviePlayerController play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
