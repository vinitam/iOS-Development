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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    [self.collectionView registerClass:[ChapterCollectionViewCell class] forCellWithReuseIdentifier:@"ChapterCollectionViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
