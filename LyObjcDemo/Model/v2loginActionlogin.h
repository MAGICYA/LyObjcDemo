//
//  v2loginActionlogin.h
//  LyObjcDemo
//
//  Created by wly1 on 16/1/26.
//
//

#import "BaseModel.h"
#import "EasemobAccountBean.h"

@interface v2loginActionlogin : BaseModel
//request
@property (strong, nonatomic) NSString *pwd;        //密码
@property (strong, nonatomic) NSString *os;         //手机固件操作系统
@property (strong, nonatomic) NSString *osVer;      //手机固件操作系统
@property (strong, nonatomic) NSString *brand;      //手机品牌
@property (strong, nonatomic) NSString *model;      //手机型号
@property (strong, nonatomic) NSString *ver;        //商家中心app版本号ID
@property (strong, nonatomic) NSString *vernm;      //商家中心app版本名称
@property (strong, nonatomic) NSString *width;      //分辨率宽度像素
@property (strong, nonatomic) NSString *height;     //分辨率高度像素
@property (strong, nonatomic) NSString *dpi;        //分辨率屏幕密度
@property (strong, nonatomic) NSString *devToken;   //苹果手机devToken
@property (strong, nonatomic) NSString *accountId;  //帐号ID
//response
@property (strong, nonatomic) NSString *mob;        //手机号码
@property (strong, nonatomic) NSString *name;       //用户名
@property (strong, nonatomic) NSString *token;      //token
@property (strong, nonatomic) NSString *headImg;    //用户个人头像
@property (strong, nonatomic) NSString *tokenVer;   //本次token版本号
@property (strong, nonatomic) NSString *desKey;     //每次登录成功后,会产生一个随机的8位DES密钥
@property (strong, nonatomic) NSArray  *tmls;       //
@property (strong, nonatomic) EasemobAccountBean *easemobAccountBean;   //
@end
