//
//  StoreViewController.m
//  BeerSample
//
//  Created by Vinita Miranda on 3/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreTableViewCell.h"
#import "MapViewController.h"

@interface StoreViewController ()
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *storeArray;
@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchStoreData];
}


-(void)viewWillAppear:(BOOL)animated
{
    self.title = [self.productDictionary objectForKey:@"name"];
}



-(void)fetchStoreData
{
    self.tableView.hidden = YES;

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ontariobeerapi.ca:80/products/%@/stores/",[self.productDictionary objectForKey:@"product_id"]]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        self.storeArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        if(error != nil)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:error.description delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            self.tableView.hidden = YES;

        }
        else if([self.storeArray count] == 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No stores has this product" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            self.tableView.hidden = YES;
                                      
        }
        else
        {
            self.tableView.hidden = NO;
        }
   
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
    return [self.storeArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreTableViewCell"];
    NSDictionary *beerDictionary = [self.storeArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = [beerDictionary objectForKey:@"name"];
    cell.cityLabel.text = [beerDictionary objectForKey:@"city"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MapViewController *mapViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    mapViewController.storeDictionary = [self.storeArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:mapViewController animated:YES];
    self.title = @"";

}


@end
