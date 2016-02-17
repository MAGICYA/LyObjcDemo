//
//  ACL.m
//  mama100
//
//  Created by linwaiwai on 8/18/14.
//  Copyright (c) 2014 Biostime. All rights reserved.
//

#import "ACL.h"
#import "AppDelegate.h"
//#import "UserInfoModel.h"

@implementation ACL

+(BOOL)logon
{
//    User *user = [User defaultUser];
//
//    if (user && user.logon)
//    {
//        return YES;
//    }
//    else
//    {
//        [[AppDelegate sharedInstance] checkUserInfo];
//        
//        return NO;
//    }
    return NO;
}

+(BOOL)perfectMemInfo
{
//    User *user = [User defaultUser];
//    NSArray *children =  [user.childs fetchRecords];
//    
//    if ([children count] > 0)
//    {
//        return YES;
//    }
//    else
//    {
//        [[AppDelegate sharedInstance] performMemberInfoView];
//        
//        return NO;
//    }
    return NO;
}

+(NSArray *)aclMap{

    NSArray *map = @[
                     @{
                         @"class":@"ProductBaseInfoView",
                         @"actions":@"onBugAction:",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"ShopCartViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"StoreDetailsViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                         },
                     @{
                         @"class":@"BarcodeScanningViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     
                     //妈妈圈
                     @{
                         @"class":@"ThemeView",
                         @"actions":@"onPraiseBtnClick:",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"ThemeView",
                         @"actions":@"onCommentBtnClick:",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"ThemeView",
                         @"actions":@"onMutilFuctionBtnClick:",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"ThemeView",
                         @"actions":@"deleteTheme",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"MamaClubTopicDetailViewController",
                         @"actions":@"onJoinInClick",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"PhotoShowViewControllerNew",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"MamaClubUserTimeLineViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     
                     //消息列表
                     @{
                         @"class":@"ClassifyMessagesViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"MSGListViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"MemberInfoIndexViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"ExChangeCodeViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     @{
                         @"class":@"MemberCardViewController",
                         @"actions":@"*",
                         @"filters":@"logon"
                      },
                     ];
    return map;
}

+(NSArray *)aclMapForInfo
{
    
    NSArray *map = @[
                     @{
                         @"class":@"PhotoShowViewControllerNew",
                         @"actions":@"*",
                         @"filters":@"perfectMemInfo"
                         },
                     ];
    return map;
}

+(bool)hookTabBarControlller:(UIViewController*)tabBarController whenViewControllerDidSelect:(UIViewController*)viewController{
 
     NSArray *classes = [[self aclMap] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.class = %@ AND SELF.actions='*'",NSStringFromClass(  [viewController class])]];
    if ([classes count]) {
        SEL origSel = NSSelectorFromString((NSString *)classes[0][@"filters"]);
        return [ACL performSelector:origSel];
    }
    return YES;
}

+(bool)hookNavigationControlller:(UINavigationController*)navigationController whenViewControllerDidSelect:(UIViewController*)viewController
{
    
    NSArray *classes = [[self aclMap] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.class = %@ AND SELF.actions='*'",NSStringFromClass(  [viewController class])]];
    
    NSArray *classesInfo = [[self aclMapForInfo] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.class = %@ AND SELF.actions='*'",NSStringFromClass(  [viewController class])]];
    
//    User *user = [User defaultUser];
//    if (user && user.logon)
//    {
//        if ([classesInfo count])
//        {
//            SEL origSel = NSSelectorFromString((NSString *)classesInfo[0][@"filters"]);
//            return [ACL performSelector:origSel];
//        }
//    }
    
    if ([classes count])
    {
        SEL origSel = NSSelectorFromString((NSString *)classes[0][@"filters"]);
        return [ACL performSelector:origSel];
    }
        
    return YES;
}

+(void)inject{
    
    for (NSDictionary *acl in [ACL aclMap]) {
        NSString *className = (NSString *)acl[@"class"];
        SEL origSel = NSSelectorFromString((NSString *)acl[@"actions"]);
        
        NSMutableArray *actions = [NSMutableArray arrayWithArray:[(NSString *)acl[@"actions"] componentsSeparatedByString:@":"]];
        if ([actions count]) {
            [actions replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%@Anonymous", actions[0] ]];
        }
        NSString *origSel2Str = [actions componentsJoinedByString:@":"];

        SEL origSel2 =  NSSelectorFromString(origSel2Str);
        IMP emptyFunc = imp_implementationWithBlock(^(id _self, ...) {
        });
        IMP funcWrapper = imp_implementationWithBlock(^(id _self, ...) {
            if ([acl count]>2) {
                // 检查授权
                SEL origSel = NSSelectorFromString((NSString *)acl[@"filters"]);
                if (![ACL performSelector:origSel]) {
                    return ;
                }
            }
            va_list args;
            // 读取所有参数
            va_start(args, _self);
            // 一会需要交换
            NSMethodSignature *cbSignature = [_self methodSignatureForSelector:origSel2];
            NSInvocation *cbInvocation = [NSInvocation invocationWithMethodSignature:cbSignature];
            [cbInvocation setSelector:origSel2];
            [cbInvocation setTarget:_self];
            [cbInvocation setArgumentsFromArgumentList:args];
            //[cbInvocation retainArguments];
            [cbInvocation invoke];
            va_end(args);
        });
        
        Method m = class_getInstanceMethod(NSClassFromString(className), origSel);
        class_addMethod(NSClassFromString(className), origSel2,  emptyFunc, method_getTypeEncoding(m));
        Method originalMethod = class_getInstanceMethod(NSClassFromString(className), origSel);
        Method swizzledMethod = class_getInstanceMethod(NSClassFromString(className), origSel2);
        method_exchangeImplementations(originalMethod, swizzledMethod);
        class_replaceMethod(NSClassFromString(className), origSel,  funcWrapper, NULL);
    }

}



@end
