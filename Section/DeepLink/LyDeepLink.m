//
//  LyDeepLink.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/17.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LyDeepLink.h"
#import <DeepLinkKit/DeepLinkKit.h>

@implementation LyDeepLink
+ (LyDeepLink *)sharedInstance
{
    static dispatch_once_t onceToken;
    static LyDeepLink *sSharedInstance;
    
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[LyDeepLink alloc] init];
    });
    return sSharedInstance;
}

-(id)init{
    self = [super init];
    if (self) {
        _router = [[DPLDeepLinkRouter alloc] init];
    }
    return self;
}
- (void)handleURL:(NSURL *)url withCompletion:(DPLRouteCompletionBlock)completionHandler
{
    [_router handleURL:url withCompletion:completionHandler];
}

@end
