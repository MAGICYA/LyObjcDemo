//
//  LyDeepLink.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/17.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyDeepLink : NSObject
@property (strong, nonatomic) DPLDeepLinkRouter *router;
+ (LyDeepLink *)sharedInstance;
- (void)handleURL:(NSURL *)url withCompletion:(DPLRouteCompletionBlock)completionHandler;
@end
