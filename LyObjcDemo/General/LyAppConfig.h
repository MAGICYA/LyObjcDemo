//
//  LyAppConfig.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/18.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyAppConfig : NSObject
+(NSString*)Width;         //分辨率宽度像素
+(NSString*)Height;        //分辨率高度像素
+(NSString*)dpi;           //分辨率屏幕密度
+(NSString*)vernm;         //商家中心app版本名称
+(NSString*)ver;           //商家中心app版本号ID
+(NSString*)model;         //手机型号
+(NSString*)brand;         //手机品牌
+(NSString*)osver;         //手机固件操作系统
+(NSString*)os;            //手机操作系统
@end
