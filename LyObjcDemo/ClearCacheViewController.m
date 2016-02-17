//
//  ClearCacheViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 15/12/29.
//
//

#import "ClearCacheViewController.h"

@interface ClearCacheViewController ()
@property (strong, nonatomic) NSString *sURL;
@end

@implementation ClearCacheViewController
-(id)initWithURL:(NSString*)strURL{
    self = [super init];
    if(self)
    {
        _sURL = strURL;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:_sURL]];
    [webView loadRequest:req];
    [self.view addSubview:webView];
    
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 100, 50)];
    [clearBtn setBackgroundColor:[UIColor redColor]];
    [clearBtn bk_whenTapped:^{
        NSLog(@"tap ClearBtn");
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    }];
    [self.view addSubview:clearBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
