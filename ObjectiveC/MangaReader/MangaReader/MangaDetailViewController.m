//
//  MangaDetailViewController.m
//  MangaReader
//
//  Created by Vinita Miranda on 2/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "MangaDetailViewController.h"
#import "ChapterDetailViewController.h"
#import "AppDelegate.h"
@interface MangaDetailViewController ()
@property(nonatomic,weak)IBOutlet UILabel *descriptionLabel;
@property(nonatomic,weak)IBOutlet UIImageView *mangaImage;
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,weak)NSArray *chapters;
@property(nonatomic)AppDelegate *appDelegate;
@end

@implementation MangaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    if([[self.appDelegate getFavoritesWithName:self.manga.mangaTitle] count] ==  1)
    {
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"unfavorite"] style:UIBarButtonItemStylePlain target:self action:@selector(addToFavorites:)];
        self.navigationItem.rightBarButtonItem = barButton;
    }
    else
    {
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"favorite_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(addToFavorites:)];
        self.navigationItem.rightBarButtonItem = barButton;
    }
    
    self.title = self.manga.mangaTitle;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self fetchDataFromServer];
    

}


-(void)addToFavorites:(id)sender
{
    
    self.manga.favorite = [NSNumber numberWithBool:YES];
    [self.appDelegate.managedObjectContext save:nil];
}

-(void)fetchDataFromServer
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.mangaeden.com/api/manga/%@", self.manga.mangaId]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        self.mangaDetailsDictionary = jsonResponse;
        self.descriptionLabel.text = [self.mangaDetailsDictionary objectForKey:@"description"];
        self.chapters = [self.mangaDetailsDictionary objectForKey:@"chapters"];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://cdn.mangaeden.com/mangasimg/%@",[self.mangaDetailsDictionary objectForKey:@"image"]]]];
            
            if(data)
            {
                UIImage *mangaImage = [UIImage imageWithData:data];
                if(mangaImage)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIImage *mangaImage = [UIImage imageWithData:data];
                        self.mangaImage.image = mangaImage;
                    });
                }
            }
            
        });

        
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
    return [self.chapters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *chapterArray = [self.chapters objectAtIndex:[self.chapters count]- indexPath.row-1];
    cell.textLabel.text = [NSString stringWithFormat:@"CHAPTER: %@",[chapterArray objectAtIndex:0]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *chapterArray = [self.chapters objectAtIndex:[self.chapters count]- indexPath.row-1];
    
    ChapterDetailViewController *chapterDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ChapterDetailViewController"];
    chapterDetailViewController.chapterUrl = [NSString stringWithFormat:@"https://www.mangaeden.com/api/chapter/%@",[chapterArray objectAtIndex:3]];
    [self.navigationController pushViewController:chapterDetailViewController animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}


@end
