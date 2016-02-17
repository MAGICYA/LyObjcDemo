//
//  LoginApi.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/17.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LyRequest.h"

@interface LoginApi : LyRequest
-(void)LoginApiWithUserName:(NSString *)userName passWord:(NSString*)password;
@end
