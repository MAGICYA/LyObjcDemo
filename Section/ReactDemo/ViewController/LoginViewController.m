//
//  LoginViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 15/12/2.
//
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) UITextField *userNameTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    _userNameTextField.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_userNameTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
    _passwordTextField.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_passwordTextField];
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    _loginButton.backgroundColor = [UIColor blackColor];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
//    [_loginButton bk_whenTapped:^{
//        [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//            [_viewModel login];
//        }];
//    }];
    [self.view addSubview:_loginButton];
    
    [self bindModel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) bindModel {
    _viewModel = [[LoginVCViewModel alloc] init];
    
    RAC(self.viewModel, userName) = self.userNameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    RAC(self.loginButton, enabled) = [_viewModel buttonIsValid];
    
    @weakify(self);
    [self.viewModel.successObject subscribeNext:^(NSArray* x) {
        @strongify(self);
        LoginSuccessViewController *vc = [[LoginSuccessViewController alloc] init];
        vc.userName = x[0];
        vc.password = x[1];
        [self presentViewController:vc animated:YES completion:^{
            
        }];
    }];
    
    [self.viewModel.failureObject subscribeNext:^(id x) {
        
    }];
    
    [self.viewModel.errorObject subscribeNext:^(id x) {
    }];
    
    [RACObserve(self, viewModel.userName) subscribeNext:^(NSString *newName) {
        NSLog(@"%@", newName);
    }];
    
//    [[RACObserve(self, viewModel.userName) filter:^BOOL(id value) {
//        NSInteger len = [value length];
//        if(len % 10 == 0)
//        {
//            return YES;
//        }
//        else
//        {
//            return NO;
//        }
//        
//    }]subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];

//    RAC(self, viewModel.userName) = [RACSignal
//                                combineLatest:@[ RACObserve(self, viewModel.userName), RACObserve(self, viewModel.password) ]
//                                reduce:^(NSString *password, NSString *passwordConfirm) {
//                                    return @([passwordConfirm isEqualToString:password]);
//                                }];
    
//    _loginButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
//        NSLog(@"button was pressed");
//        return [RACSignal empty];
//    }];
    
    return;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
