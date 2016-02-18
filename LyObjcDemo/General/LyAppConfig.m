//
//  LyAppConfig.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/18.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LyAppConfig.h"

@implementation LyAppConfig
+(NSString*)Width         //分辨率宽度像素
{
    return [NSString stringWithFormat:@"640"];
}
+(NSString*)Height        //分辨率高度像素
{
    return [NSString stringWithFormat:@"1136"];
}
+(NSString*)dpi           //分辨率屏幕密度
{
    return [NSString stringWithFormat:@"326"];
}
+(NSString*)vernm         //商家中心app版本名称
{
    return [NSString stringWithFormat:@"5.1.0"];
}
+(NSString*)ver           //商家中心app版本号ID
{
    return [NSString stringWithFormat:@"25"];
}
+(NSString*)model         //手机型号
{
    UIDevice *device = [UIDevice currentDevice];
    return [NSString stringWithFormat:@"%@",device.model];
}
+(NSString*)brand         //手机品牌
{
    return [NSString stringWithFormat:@"Apple"];
}
+(NSString*)osver         //手机固件操作系统
{
    UIDevice *device = [UIDevice currentDevice];
    return [NSString stringWithFormat:@"%@",device.systemVersion];
}
+(NSString*)os            //手机操作系统
{
    return [NSString stringWithFormat:@"iOS"];
}
@end
