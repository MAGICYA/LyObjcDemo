//
//  LyRequest.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/17.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "ASIFormDataRequest.h"

typedef void (^LyHTTPBasicBlock)(id);

@interface LyRequest : NSObject
@property (copy, nonatomic) LyHTTPBasicBlock successBlock;
@property (copy, nonatomic) LyHTTPBasicBlock failBlock;
@property (strong, nonatomic) NSString *apiURL;
@property (strong, nonatomic) NSMutableString *strURL;

-(void)GetApiWithParams:(NSDictionary*)params;
-(void)PostApiWithParams:(NSDictionary*)params;
@end
