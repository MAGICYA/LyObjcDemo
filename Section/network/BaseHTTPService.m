//
//  BaseHTTPService.m
//  LyObjcDemo
//
//  Created by wly1 on 16/1/26.
//
//

#import "BaseHTTPService.h"
#import "AFNetworking/AFHTTPRequestOperationManager.h"
#import "AFNetworking/AFHTTPSessionManager.h"

@implementation BaseHTTPService
-(void)get:(NSString*)url params:(id)params success:(void (^)())success fail:(void (^)())fail
{
    [[AFHTTPRequestOperationManager manager] GET:url
                                      parameters:params
                                         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if (success) {
             success();
         }
     }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if (fail) {
             fail();
         }
     }];
    return;
}
@end
