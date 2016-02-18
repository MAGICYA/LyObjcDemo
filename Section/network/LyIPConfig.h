//
//  LyIPConfig.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/18.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyIPConfig : NSObject
@property (strong, nonatomic) NSString *defaultServer;
@property (strong, nonatomic) NSString *defaultPort;
+ (instancetype)sharedInstance;
-(NSString*)formatHttpUrl;
-(NSString*)formatHttpsUrl;
@end
