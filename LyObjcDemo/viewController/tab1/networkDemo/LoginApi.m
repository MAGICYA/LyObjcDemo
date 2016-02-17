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
    NSDictionary *dic = @{@"userName":userName, @"password":password};
    [self GetWithParams:dic];
    return;
}
-(void)GetWithParams:(NSDictionary*)params
{
    [super ApiWithParams:params];
    return;
}
@end
