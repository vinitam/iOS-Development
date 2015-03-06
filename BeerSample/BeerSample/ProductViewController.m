//
//  ProductViewController.m
//  BeerSample
//
//  Created by Vinita Miranda on 3/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ProductViewController.h"
#import "BeerTableViewCell.h"
#import "StoreViewController.h"
@interface ProductViewController ()
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *productArray;
@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchProductData];
}


-(void)viewWillAppear:(BOOL)animated
{
    self.title = [self.beerDictionary objectForKey:@"name"];
}



-(void)fetchProductData
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ontariobeerapi.ca:80/beers/%@/products/",[self.beerDictionary objectForKey:@"beer_id"]]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        self.productArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
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
    return [self.productArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BeerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeerTableViewCell"];
    NSDictionary *beerDictionary = [self.productArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = [beerDictionary objectForKey:@"name"];
    cell.typeLabel.text = [beerDictionary objectForKey:@"size"];
    cell.ratingLabel.text = [beerDictionary objectForKey:@"price"];
    
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
    StoreViewController *storeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"StoreViewController"];
    storeViewController.productDictionary = [self.productArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:storeViewController animated:YES];
    self.title = @"";

}


@end
