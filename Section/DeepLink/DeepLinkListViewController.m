//
//  DeepLinkListViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/1.
//
//

#import "DeepLinkListViewController.h"
#import "ExecuteDeepLinkViewController.h"

@interface DeepLinkListViewController ()

@end

@implementation DeepLinkListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"DeepLinkList";
    MGScrollView *scroll = [[MGScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = [UIColor yellowColor];
    scroll.contentLayoutMode = MGLayoutGridStyle;
    [self.view addSubview:scroll];
    
    MGBox *box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"regist /say/:title/:message";
    [box addSubview:label];
    box.onTap = ^{
        [LyDeepLink sharedInstance].router[@"say/:title/:message"] = ^(DPLDeepLink *link){
            [[[UIAlertView alloc] initWithTitle:link.routeParameters[@"title"]
                                        message:link.routeParameters[@"message"]
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                              otherButtonTitles:nil] show];
        };
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"execute DeepLinks";
    [box addSubview:label];
    box.onTap = ^{
        ExecuteDeepLinkViewController *executeVC = [[ExecuteDeepLinkViewController alloc] init];
        [self.navigationController pushViewController:executeVC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    [scroll layout];
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
