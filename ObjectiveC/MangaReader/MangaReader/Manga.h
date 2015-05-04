//
//  Manga.h
//  MangaReader
//
//  Created by Vinita Miranda on 3/2/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Manga : NSManagedObject

@property (nonatomic, retain) NSNumber * hits;
@property (nonatomic, retain) NSNumber * lastChpDate;
@property (nonatomic, retain) NSString * mangaAlias;
@property (nonatomic, retain) NSString * mangaCategory;
@property (nonatomic, retain) NSString * mangaId;
@property (nonatomic, retain) NSString * mangaImage;
@property (nonatomic, retain) NSNumber * mangaStatus;
@property (nonatomic, retain) NSString * mangaTitle;
@property (nonatomic, retain) NSNumber * favorite;

@end
