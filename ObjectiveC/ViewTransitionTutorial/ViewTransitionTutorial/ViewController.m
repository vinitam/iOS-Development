//
//  ViewController.m
//  ViewTransitionTutorial
//
//  Created by Vinita Miranda on 1/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.transitionType = [NSArray arrayWithObjects:@"Curl Down",@"Curl Up",@"Flip From Top",@"Flip From Bottom",@"Flip From Right",@"Flip From Left",@"Dissolve",@"No Tranrition",nil];
    [self.tableView reloadData];
    [self setUpView];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpView{
    view1 = [[UIView alloc]initWithFrame:self.view.frame];
    view1.backgroundColor = [UIColor lightTextColor];
    view2 = [[UIView alloc]initWithFrame:self.view.frame];
    view2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    [self.view sendSubviewToBack:view1];
    
}

-(void)doTransitionWithType:(UIViewAnimationOptions)animationTransitionType{
    if ([[self.view subviews] containsObject:view2 ]) {
        [UIView transitionFromView:view2
                            toView:view1
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view2 removeFromSuperview];
                        }];
        [self.view addSubview:view1];
        [self.view sendSubviewToBack:view1];
    }
    else{
        
        [UIView transitionFromView:view1
                            toView:view2
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view1 removeFromSuperview];
                        }];
        [self.view addSubview:view2];
        [self.view sendSubviewToBack:view2];
        
    }
}


-(void)flipFromLeft
{
    [self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromLeft];
    
}
-(void)flipFromRight{
    [self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromRight];
    
}
-(void)flipFromTop{
    [self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromTop];
    
}
-(void)flipFromBottom{
    [self doTransitionWithType:UIViewAnimationOptionTransitionFlipFromBottom];
    
}
-(void)curlUp{
    [self doTransitionWithType:UIViewAnimationOptionTransitionCurlUp];
    
}
-(void)curlDown{
    [self doTransitionWithType:UIViewAnimationOptionTransitionCurlDown];
    
}
-(void)dissolve{
    [self doTransitionWithType:UIViewAnimationOptionTransitionCrossDissolve];
    
}
-(void)noTransition{
    [self doTransitionWithType:UIViewAnimationOptionTransitionNone];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section
{
    return [self.transitionType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.textLabel setText:[self.transitionType objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == kTypeCurlUp)
    {
        [self curlUp];
    }
    else if(indexPath.row == kTypeCurlDown)
    {
        [self curlDown];
    }
    else if(indexPath.row == kTypeFlipTop)
    {
        [self flipFromTop];
    }
    else if(indexPath.row == kTypeFlipBottom)
    {
        [self flipFromBottom];
    }
    else if(indexPath.row == kTypeFlipFromRight)
    {
        [self flipFromRight];
    }
    else if(indexPath.row == kTypeFlipFromLeft)
    {
        [self flipFromLeft];
    }
    else if(indexPath.row == kTypeDissolve)
    {
        [self dissolve];
    }
    else if(indexPath.row == kTypeNoTransition)
    {
        [self noTransition];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
