//
//  AppDelegate.h
//  LyObjcDemo
//
//  Created by wly1 on 15/10/26.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ASIDownloadCache.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) ASIDownloadCache *localCache;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

