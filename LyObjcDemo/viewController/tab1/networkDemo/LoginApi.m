//
//  LoginApi.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/17.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LoginApi.h"

@implementation LoginApi
-(void)LoginApiWithUserName:(NSString *)userName passWord:(NSString*)password
{
    self.apiURL = @"mobile/login/v2loginActionlogin.action";
    [self GetApiWithParams:@{@"opno":userName, @"pwd":@"3472f86b53ea536fd47d3aa8a212d1ea"}];
    return;
}

@end
