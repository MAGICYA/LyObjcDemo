//
//  ACL.h
//  mama100
//
//  Created by linwaiwai on 8/18/14.
//  Copyright (c) 2014 Biostime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSInvocation+EXT.h"
//#import "User.h"
@interface ACL : NSObject
+(void)inject;
+(bool)hookTabBarControlller:(UIViewController*)tabBarController whenViewControllerDidSelect:(UIViewController*)viewController;
+(bool)hookNavigationControlller:(UINavigationController*)navigationController whenViewControllerDidSelect:(UIViewController*)viewController;
@end
