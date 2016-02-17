//
//  BaseHTTPService.h
//  LyObjcDemo
//
//  Created by wly1 on 16/1/26.
//
//

#import <Foundation/Foundation.h>

@interface BaseHTTPService : NSObject
-(void)get:(NSString*)url params:(id)params success:(void (^)())success fail:(void (^)())fail;
@end
