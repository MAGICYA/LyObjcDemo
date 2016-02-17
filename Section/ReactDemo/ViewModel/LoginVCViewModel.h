//
//  LoginVCViewModel.h
//  LyObjcDemo
//
//  Created by wly1 on 15/12/2.
//
//

#import "BaseVCViewModel.h"
//#import <ReactiveCocoa/RACSignal.h>
@interface LoginVCViewModel : BaseVCViewModel
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) RACSubject *successObject;
@property (strong, nonatomic) RACSubject *failureObject;
@property (strong, nonatomic) RACSubject *errorObject;
-(id)buttonIsValid;
-(void)login;
@end
