//
//  LoginVCViewModel.m
//  LyObjcDemo
//
//  Created by wly1 on 15/12/2.
//
//

#import "LoginVCViewModel.h"

@interface LoginVCViewModel()
@property (strong, nonatomic) RACSignal *userNameSignal;
@property (strong, nonatomic) RACSignal *passwordSignal;
@property (strong, nonatomic) NSArray *requestData;
@end

@implementation LoginVCViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void) initialize {
    _userNameSignal = RACObserve(self, userName);
    _passwordSignal = RACObserve(self, password);
    _successObject = [RACSubject subject];
    _failureObject = [RACSubject subject];
    _errorObject = [RACSubject subject];
    return;
}

-(id) buttonIsValid {
    RACSignal *isValid = [RACSignal combineLatest:@[_userNameSignal,_passwordSignal]
                                           reduce:^id(NSString *userName,NSString *password)
                          {
                              return @(userName.length >= 3 && password.length >=3);
                          }];
    return isValid;
}

-(void) login {
    _requestData = @[_userName, _password];
    [_successObject sendNext:_requestData];
    return;
}
@end
