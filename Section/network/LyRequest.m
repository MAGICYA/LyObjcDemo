//
//  LyRequest.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/17.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LyRequest.h"
#import "LyIPConfig.h"
#import "LyAppConfig.h"

@implementation LyRequest
-(void)GetApiWithParams:(NSDictionary*)params{
    NSURL *requestURL               =   [NSURL URLWithString:[self requestURLwithParams:params]];
    ASIFormDataRequest *getRequest  =   [ASIFormDataRequest requestWithURL:requestURL];
    
    getRequest.requestMethod        =   @"GET";
    __weak ASIFormDataRequest *weakGetRequest = getRequest;
    [getRequest setCompletionBlock:^{
        if (_successBlock) {
            _successBlock(weakGetRequest.responseString);
        }
        
    }];
    [getRequest setFailedBlock:^{
        if (_failBlock) {
            _failBlock(weakGetRequest.error);
        }
        
    }];
    NSLog(@"LyRequest URL \n === \n%@ \n参数：\n%@ \n === \n",getRequest.url,params);
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
-(NSString*)requestURLwithParams:(NSDictionary*)params{
    NSMutableString *strURL = [NSMutableString stringWithString:@""];
    [strURL appendString:[[LyIPConfig sharedInstance] formatHttpUrl]];
    [strURL appendString:[NSString stringWithFormat:@"/%@?",_apiURL]];
    
    [strURL appendString:[self defaultParams]];
    
    [strURL appendString:@"&"];
    NSMutableArray *paramsArr = [NSMutableArray arrayWithCapacity:10];
    for (NSString *key in [params allKeys]) {
        [paramsArr addObject:[NSString stringWithFormat:@"%@=%@",key,params[key]]];
    }
    NSString *paramsStr = [paramsArr componentsJoinedByString:@"&"];
    [strURL appendString:paramsStr];
    
    [strURL appendString:@"&devid=a903ba2f3ceabd9fc9550b1d7539f9ac&tsno=1455462422.872019"];

    return [NSString stringWithString:strURL];
}
//设备基础参数
-(NSString*)defaultParams{
    NSMutableArray *deviceParamsArr = [NSMutableArray arrayWithCapacity:10];
    
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"brand",[LyAppConfig brand]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"model",@"x86_64"]];
//    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"model",[LyAppConfig model]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"os",[LyAppConfig os]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"osver",[LyAppConfig osver]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"dpi",[LyAppConfig dpi]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"width",[LyAppConfig Width]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"height",[LyAppConfig Height]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"ver",[LyAppConfig ver]]];
    [deviceParamsArr addObject:[NSString stringWithFormat:@"%@=%@",@"vernm",[LyAppConfig vernm]]];
    
    return [deviceParamsArr componentsJoinedByString:@"&"];
}
@end
