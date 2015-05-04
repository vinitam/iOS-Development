//
//  MangaDetailViewController.h
//  MangaReader
//
//  Created by Vinita Miranda on 2/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manga.h"
@interface MangaDetailViewController : UIViewController
@property(nonatomic)Manga *manga;
@property(nonatomic)NSDictionary *mangaDetailsDictionary;
@end
