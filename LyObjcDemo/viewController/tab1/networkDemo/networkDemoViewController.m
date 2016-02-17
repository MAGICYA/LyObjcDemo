//
//  networkDemoViewController.m
//  LyObjcDemo
//
//  Created by walson-mac on 16/2/14.
//
//

#import "networkDemoViewController.h"
#import "MGBoxKit/MGBox.h"
#import "MGBoxKit/MGScrollView.h"
#import "networkASIDemoViewController.h"

@interface networkDemoViewController ()

@end

@implementation networkDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    MGScrollView *scroll = [[MGScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = [UIColor yellowColor];
    scroll.contentLayoutMode = MGLayoutGridStyle;
    [self.view addSubview:scroll];
    
    
    MGBox *box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"ASI网络加载";
    [box addSubview:label];
    box.onTap = ^{
        networkASIDemoViewController *netWorkASIDemoVC = [[networkASIDemoViewController alloc] init];
        [self.navigationController pushViewController:netWorkASIDemoVC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"AFNet网络加载";
    [box addSubview:label];
    box.onTap = ^{
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
