//
//  ProductDetailViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 16/1/29.
//
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)configureWithDeepLink:(DPLDeepLink *)deepLink {
    
    // Get the data you need from the deep link to configure your view controller.
    NSString *productId = deepLink.routeParameters[@"product_id"];
//    self.product = [Product productWithId:productId];
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