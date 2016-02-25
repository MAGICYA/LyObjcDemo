//
//  LoginModel.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/22.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol LoginModel
@end

@interface LoginModel : JSONModel
@property (strong, nonatomic) NSString *accountId;
@property (strong, nonatomic) NSString *hq;
@property (strong, nonatomic) NSString *tc;
@property (strong, nonatomic) NSString *tn;
@end

@interface LoginMobReq : JSONModel
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSArray<LoginModel>* tmls;
@end

@interface LoginmobResponse : JSONModel
@property (strong, nonatomic) LoginMobReq* mobResponse;
//@property (strong, nonatomic) NSArray<LoginModel>* tmls;
@end

//@protocol yyLoginModel
//@end
@interface yyLoginModel : NSObject
@property (strong, nonatomic) NSString *accountId;
@property (strong, nonatomic) NSString *hq;
@property (strong, nonatomic) NSString *tc;
@property (strong, nonatomic) NSString *tn;
@end

@interface yyLoginMobReq : NSObject
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSArray* tmls;
@end

@interface yyLoginmobResponse : NSObject
@property (strong, nonatomic) yyLoginMobReq* mobResponse;
@end

