//
//  ChapterDetailViewController.m
//  MangaReader
//
//  Created by Vinita Miranda on 2/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "ChapterDetailViewController.h"
#import "ChapterCollectionViewCell.h"
@interface ChapterDetailViewController ()
@property(nonatomic)IBOutlet UICollectionView *collectionView;
@property(nonatomic)NSArray *chapterArray;
@end

@implementation ChapterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchDataFromServer];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.pagingEnabled = YES;
    
}

-(void)fetchDataFromServer
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:self.chapterUrl] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        self.chapterArray = [dictionary objectForKey:@"images"];
        [self.collectionView reloadData];
        
    }];
    [task resume];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.chapterArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChapterCollectionViewCell *cell =  [collectionView  dequeueReusableCellWithReuseIdentifier:@"ChapterCollectionViewCell" forIndexPath:indexPath];
 
    NSArray *array = [self.chapterArray objectAtIndex:indexPath.row];
                      
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://cdn.mangaeden.com/mangasimg/%@",[array objectAtIndex:1]]]];
        
        if(data)
        {
            UIImage *mangaImage = [UIImage imageWithData:data];
            if(mangaImage)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage *mangaImage = [UIImage imageWithData:data];
                    cell.chapterImage.image = mangaImage;
                });
            }
        }
        
    });
    

    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width - 10, self.view.frame.size.height - 20);
}

@end
