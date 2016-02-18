//
//  LyIPConfig.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/18.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LyIPConfig.h"

@implementation LyIPConfig
+ (instancetype)sharedInstance {
    static LyIPConfig *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
-(id)init{
    self = [super init];
    if (self) {
        _defaultServer = @"192.168.115.4";
        _defaultPort = @"9580";
    }
    return self;
}
-(NSString*)formatHttpUrl{
    return [NSString stringWithFormat:@"http://%@:%@",_defaultServer,_defaultPort];
}
-(NSString*)formatHttpsUrl{
    return [NSString stringWithFormat:@"https://%@:%@",_defaultServer,_defaultPort];
}
@end
