//
//  ViewController.m
//  CustomTableView
//
//  Created by Vinita Miranda on 2/22/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
@interface ViewController ()
@property(nonatomic)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *shoppingCart;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shoppingCart = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Carrot",@"Rs 40",@"1 kg", nil] forKeys:[NSArray arrayWithObjects:@"title",@"cost",@"quantity", nil]],[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tomato",@"Rs 35",@"2 kg", nil] forKeys:[NSArray arrayWithObjects:@"title",@"cost",@"quantity", nil]],[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Apple",@"Rs 60",@"2 kg", nil] forKeys:[NSArray arrayWithObjects:@"title",@"cost",@"quantity", nil]],nil];

    [self.tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.shoppingCart count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    NSDictionary *dictionary = [self.shoppingCart objectAtIndex:indexPath.row];
    cell.itemName.text = [dictionary objectForKey:@"title"];
    cell.costLabel.text = [dictionary objectForKey:@"cost"];
    cell.quantityLabel.text = [dictionary objectForKey:@"quantity"];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
