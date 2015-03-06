//
//  ViewController.m
//  BeerSample
//
//  Created by Vinita Miranda on 3/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "BeerViewController.h"
#import "BeerTableViewCell.h"
#import "ProductViewController.h"
@interface BeerViewController ()
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *beerArray;
@end

@implementation BeerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;

    [self fetchBeerData];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Beer";
}

-(void)fetchBeerData
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"http://ontariobeerapi.ca:80/beers/"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        self.beerArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];

        });
        
        
    }];
    [task resume];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.beerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BeerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeerTableViewCell"];
    NSDictionary *beerDictionary = [self.beerArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = [beerDictionary objectForKey:@"name"];
    cell.typeLabel.text = [beerDictionary objectForKey:@"type"];
    cell.ratingLabel.text = [beerDictionary objectForKey:@"abv"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[beerDictionary objectForKey:@"image_url"]]];
        
        if(data)
        {
            UIImage *beerImage = [UIImage imageWithData:data];
            if(beerImage)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage *beerImage = [UIImage imageWithData:data];
                    cell.iconImageView.image = beerImage;
                });
            }
        }
        
    });
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.title = @"";
    ProductViewController *productViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductViewController"];
    productViewController.beerDictionary = [self.beerArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:productViewController animated:YES];

}



@end
