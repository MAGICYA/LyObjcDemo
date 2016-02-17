//
//  LyRequest.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/17.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LyRequest.h"

@implementation LyRequest
-(void)GetApiWithParams:(NSDictionary*)params{
    ASIFormDataRequest *getRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://192.168.115.4:9580/mobile/login/v2loginActionlogin.action?opno=13800138000&width=640&brand=Apple&os=iOS&devid=a903ba2f3ceabd9fc9550b1d7539f9ac&dpi=326&ver=25&height=1136&pwd=3472f86b53ea536fd47d3aa8a212d1ea&osver=9.2&vernm=5.1.0&model=x86_64&tsno=1455462422.872019"]];
    getRequest.requestMethod = @"GET";
    __weak ASIFormDataRequest *weakGetRequest = getRequest;
    [getRequest setCompletionBlock:^{
        _successBlock(weakGetRequest.responseString);
    }];
    [getRequest setFailedBlock:^{
        _failBlock(weakGetRequest.error);
    }];
    NSLog(@"LyRequest URL %@",getRequest.url);
    [getRequest startAsynchronous];
    return;
}
-(void)PostApiWithParams:(NSDictionary*)params{
    ASIFormDataRequest *postRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://192.168.115.4:9580"]];
    postRequest.requestMethod = @"Post";
    postRequest.postBody = [NSMutableData dataWithContentsOfURL:[NSURL URLWithString:@"http://192.168.115.4:9580/mobile/login/v2loginActionlogin.action?opno=13800138000&width=640&brand=Apple&os=iOS&devid=a903ba2f3ceabd9fc9550b1d7539f9ac&dpi=326&ver=25&height=1136&pwd=3472f86b53ea536fd47d3aa8a212d1ea&osver=9.2&vernm=5.1.0&model=x86_64&tsno=1455462422.872019"]];
    __weak ASIFormDataRequest *weakPostRequest = postRequest;
    [postRequest setCompletionBlock:^{
        _successBlock(weakPostRequest.responseString);
    }];
    [postRequest setFailedBlock:^{
        _failBlock(weakPostRequest.error);
    }];
    NSLog(@"LyRequest URL %@",postRequest.url);
    [postRequest startAsynchronous];
    return;
}
@end
