//
//  EasemobAccountBean.h
//  LyObjcDemo
//
//  Created by wly1 on 16/1/26.
//
//

#import "BaseModel.h"

@interface EasemobAccountBean : BaseModel
@property (strong, nonatomic) NSString *easemobAccountId;   //环信账号ID
@property (strong, nonatomic) NSString *EasemobPassWord;    //环信密码
@property (strong, nonatomic) NSString *nickName;           //昵称
@end
