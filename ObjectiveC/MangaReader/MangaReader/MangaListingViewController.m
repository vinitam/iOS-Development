//
//  ViewController.m
//  MangaReader
//
//  Created by Vinita Miranda on 2/25/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "MangaListingViewController.h"
#import "CustomMangaCell.h"
#import "MangaDetailViewController.h"
#import "Manga.h"
#import "AppDelegate.h"
@interface MangaListingViewController ()
@property(nonatomic,weak)IBOutlet  UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *mangaArray;

@end

@implementation MangaListingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchMangaData];
    
    NSDictionary *dictionary = [[NSDictionary alloc]initWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor],[UIFont fontWithName:@"HelveticaNeue-Medium" size:24],nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName,NSFontAttributeName,nil]];
    self.navigationController.navigationBar.titleTextAttributes = dictionary;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:130.0/255.0 green:210.0/255.0 blue:224.0/255.0 alpha:1];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Manga";

}

-(void)fetchMangaData
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.mangaeden.com/api/list/0/?p=1&l=1"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSArray *tempArray = [jsonResponse objectForKey:@"manga"];
        
        self.mangaArray = [[NSMutableArray alloc]init];
        
        for(NSDictionary *dicionary in tempArray)
        {
            Manga *manga = [NSEntityDescription insertNewObjectForEntityForName:@"Manga" inManagedObjectContext:appDelegate.managedObjectContext];
            NSString *image = [dicionary objectForKey:@"im"];
            
            if(![image isKindOfClass:[NSNull class]])
            {
                manga.mangaImage = [dicionary objectForKey:@"im"];
            }
            manga.mangaId = [dicionary objectForKey:@"i"];
            manga.mangaTitle = [dicionary objectForKey:@"t"];
            manga.mangaAlias = [dicionary objectForKey:@"a"];
            manga.mangaStatus = [NSNumber numberWithInt:[[dicionary objectForKey:@"s"]intValue]];
            manga.lastChpDate = [dicionary objectForKey:@"ld"];
            manga.hits = [NSNumber numberWithInt:[[dicionary objectForKey:@"h"]intValue]];
            [self.mangaArray addObject:manga];
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
    return [self.mangaArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomMangaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomMangaCell"];

    Manga *manga = [self.mangaArray objectAtIndex:indexPath.row];
    

    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://cdn.mangaeden.com/mangasimg/%@",manga.mangaImage]]];
        
        if(data)
        {
            UIImage *mangaImage = [UIImage imageWithData:data];
            if(mangaImage)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage *mangaImage = [UIImage imageWithData:data];
                    cell.mangaImageView.image = mangaImage;
                });
            }
        }
        
    });
    cell.tag = indexPath.row;
    cell.titleLabel.text = manga.mangaTitle;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

                                             
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CustomMangaCell *cell = sender;
    MangaDetailViewController *detailedVC = segue.destinationViewController  ;
    detailedVC.manga = [self.mangaArray objectAtIndex:cell.tag];
    self.title = @"";
}
                                             
@end
