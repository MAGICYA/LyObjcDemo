//
//  LoginViewController.h
//  LyObjcDemo
//
//  Created by wly1 on 15/12/2.
//
//

#import <UIKit/UIKit.h>
#import "LoginVCViewModel.h"
#import "LoginSuccessViewController.h"

@interface LoginViewController : UIViewController
@property (strong, nonatomic) LoginVCViewModel *viewModel;
@property (strong, nonatomic) NSArray *dataSource;
@end
