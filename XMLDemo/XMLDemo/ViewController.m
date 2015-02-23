//
//  ViewController.m
//  XMLDemo
//
//  Created by Vinita Miranda on 2/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ViewController.h"
#import "Drinks.h"

@interface ViewController ()
@property(nonatomic)NSArray *tableArray;
@property(nonatomic)IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XMLParser *parser = [[XMLParser alloc]initXMLParserWithDelegate:self];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)XMLParser:(XMLParser *)amlParser didParserDataWithOutput:(NSArray *)outputArray
{
    self.tableArray = outputArray;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Drinks *drinks = [self.tableArray objectAtIndex:indexPath.row];
    cell.textLabel.text = drinks.name;
    
    return cell;
}



@end
