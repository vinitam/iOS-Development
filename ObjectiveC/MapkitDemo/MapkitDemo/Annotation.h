//
//  Annotation.h
//  MapkitDemo
//
//  Created by Vinita Miranda on 8/23/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation :  NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString * title;
@property(nonatomic, copy) NSString * subtitle;
@property(nonatomic, copy) NSString * imageName;

@end
