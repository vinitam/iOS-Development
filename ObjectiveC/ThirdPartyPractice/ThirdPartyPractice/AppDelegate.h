//
//  AppDelegate.h
//  ThirdPartyPractice
//
//  Created by Vinita Miranda on 3/3/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) UIWindow *window;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

