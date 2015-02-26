//
//  MangaDetailViewController.m
//  MangaReader
//
//  Created by Vinita Miranda on 2/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "MangaDetailViewController.h"

@interface MangaDetailViewController ()
@property(nonatomic,weak)IBOutlet UILabel *descriptionLabel;
@property(nonatomic,weak)IBOutlet UIImageView *mangaImage;
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,weak)NSArray *chapters;

@end

@implementation MangaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.mangaDictionary objectForKey:@"t"];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self fetchDataFromServer];
}

-(void)fetchDataFromServer
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.mangaeden.com/api/manga/%@", [self.mangaDictionary objectForKey:@"i"]]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}


@end
