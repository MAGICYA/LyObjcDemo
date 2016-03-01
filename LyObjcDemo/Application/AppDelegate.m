//
//  AppDelegate.m
//  LyObjcDemo
//
//  Created by wly1 on 15/10/26.
//
//

#import "AppDelegate.h"
#import "LyViewController.h"
#import "testImageViewController.h"
#import "Tab1ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "Tab2ViewController.h"
#import "DXFPSLabel/DXFPSLabel.h"
#import "LyDeepLink.h"

//#import "ACL.h"

#ifndef __OPTIMIZE__
#import "RRFPSBar.h"
#endif


#import "testA.h"
#import "testAc.h"
#import "testB.h"
#import "testBd.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //master
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    self.localCache = [[ASIDownloadCache alloc]init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSLog(@"cache path:\n%@",documentDirectory);
    [self.localCache setStoragePath:documentDirectory];
    [self.localCache setDefaultCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
    
    
    
    //a.初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];
    //设置控制器为Window的根控制器
    self.window.rootViewController=tb;
//#ifndef __OPTIMIZE__
//    [[RRFPSBar sharedInstance] setHidden:NO];
//#endif
    //b.创建子控制器
    
    Tab1ViewController *c1=[[Tab1ViewController alloc]init];
    c1.view.backgroundColor=[UIColor whiteColor];
    c1.title = @"tab1";
    c1.tabBarItem.title=@"tab1";
//    c1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
//    c1.tabBarItem.badgeValue=@"123";
    UINavigationController *naviController1 = [[UINavigationController alloc] initWithRootViewController:c1];
    
    Tab2ViewController *c2=[[Tab2ViewController alloc]init];
    c2.view.backgroundColor=[UIColor greenColor];
    c2.tabBarItem.title=@"衣柜";
    c2.title = @"衣柜";
//    c2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
    UINavigationController *naviController2 = [[UINavigationController alloc] initWithRootViewController:c2];
    
    LyViewController *c3=[[LyViewController alloc]init];
    c3.view.backgroundColor=[UIColor yellowColor];
    c3.tabBarItem.title=@"动态";
    c3.title = @"动态";
//    c3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
    UINavigationController *naviController3 = [[UINavigationController alloc] initWithRootViewController:c3];
    
    LyViewController *c4=[[LyViewController alloc]init];
    c4.view.backgroundColor=[UIColor grayColor];
    c4.tabBarItem.title=@"设置";
    c4.title = @"设置";
//    c4.tabBarItem.image=[UIImage imageNamed:@"tab_me_nor"];
    UINavigationController *naviController4 = [[UINavigationController alloc] initWithRootViewController:c4];
    
    //c.2第二种方式
    tb.viewControllers=@[naviController1,naviController2,naviController3,naviController4];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    //如果使用美国站点，请加上这行代码 [AVOSCloud useAVCloudUS];
    [AVOSCloud setApplicationId:@"uJXeDJ7Sum3UdgA4LiyT5SXn"
                      clientKey:@"rUENUTdQGBUJW8p32HeXvQNS"];
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject1"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
    
    
    [DXFPSLabel showInWindow:self.window];
    // Show only if app is is not optimized (aka debug build)

    testA *aa = [[testA alloc] init];
    [aa printTestGlobal];
    
    testA *ab = [[testA alloc] init];
    [ab printTestGlobal];
    
    [aa func];
    [aa printTestGlobal];
    [ab printTestGlobal];
    
    [self registForRemoteNotification];
    
    
    /////////////////DPLDeepLinkRouter//////////////////
//    self.router = [[DPLDeepLinkRouter alloc] init];
    
//    self.router[@"/product/:product_id"] = ^(DPLDeepLink *link){
//        ProductDetailViewController *controller = [[ProductDetailViewController alloc] init];
//        controller.product_id = link.routeParameters[@"product_id"];
//        [self.window.rootViewController presentationController:controller
//                                                      animated:NO
//                                                    completion:NULL];
//    };
//    self.router[@"/event/:event_id"] = [EventRouteHandler class];
    ///////////////////////////////////
    
    return YES;
    
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    [[LyDeepLink sharedInstance].router handleURL:url withCompletion:^(BOOL handled, NSError *error) {
        NSLog(@"Handled URL");
    }];
    
    return YES;
}
-(void)registForRemoteNotification{
    UIUserNotificationType types = UIUserNotificationTypeBadge |
    UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    return;
}
-(void)registedForRemoteNotification:(NSString*)deviceToken{
    
    //show MBProgressHUD
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[(UITabBarController*)self.window.rootViewController viewControllers] objectAtIndex:0] view]
                                              animated:YES];
    hud.minShowTime = 1.0;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = deviceToken;
    [hud showAnimated:YES whileExecutingBlock:^{
    }];
    //show MBProgressHUD
    
    //保存到剪贴板
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = deviceToken;
    //保存到剪贴板

//    [BSAlertUtil showChoiceMessage:@"" message:[NSString stringWithFormat:@"deviceId %@ deviceToken %@",[UIDevice currentDevice].uniqueDeviceIdentifier,deviceToken] leftText:@"确定" rightText:nil leftEvent:nil rightEvent:nil];
    
    return;
}
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [self registedForRemoteNotification:[NSString stringWithFormat:@"%@",deviceToken]];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}
#pragma mark - ACL
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    [ACL hookTabBarControlller:tabBarController whenViewControllerDidSelect:viewController];
}
#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "mama100.LyObjcDemo" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LyObjcDemo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"LyObjcDemo.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
