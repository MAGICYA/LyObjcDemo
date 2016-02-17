//
//  WebViewRootController.m
//  LyObjcDemo
//
//  Created by wly1 on 15/12/29.
//
//

#import "WebViewRootController.h"
#import "ClearCacheViewController.h"

@interface WebViewRootController ()

@end

@implementation WebViewRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MGScrollView *scroll = [[MGScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:scroll];
    
    NSDictionary *strDic = @{@"首焦活动":@"http://mp.weixin.qq.com/s?__biz=MjM5MDgyMzAxMQ==&mid=401713395&idx=1&sn=922f12b841f5a752270643038ac7c472",
                             @"拼团采购":@"http://img.mama100.cn/hyt_h5/B2B/flash_sale/index.html?token=79f2bfe0156191211a04765fbc0f452c&reload=true",
                             @"母婴店":@"http://m.mama100.com/html5/o2o/terminal3.2/store_index_v4.2.html?view=1#termnCode=10003"};
    
    MGBox *box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"首焦活动";
    [box addSubview:clearCache];
    box.onTap = ^{
        ClearCacheViewController *web = [[ClearCacheViewController alloc] initWithURL:strDic[@"首焦活动"]];
        [self.navigationController pushViewController:web animated:YES];
    };
    [scroll.boxes addObject:box];
    

    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"拼团采购";
    [box addSubview:clearCache];
    box.onTap = ^{
        ClearCacheViewController *web = [[ClearCacheViewController alloc] initWithURL:strDic[@"拼团采购"]];
        [self.navigationController pushViewController:web animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"母婴店";
    [box addSubview:clearCache];
    box.onTap = ^{
        ClearCacheViewController *web = [[ClearCacheViewController alloc] initWithURL:strDic[@"母婴店"]];
        [self.navigationController pushViewController:web animated:YES];
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
