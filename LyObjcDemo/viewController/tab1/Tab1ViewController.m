//
//  Tab1ViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 15/10/30.
//
//

#import "Tab1ViewController.h"
#import "testImageViewController.h"
#import "testAFNetworkingViewC.h"
#import "testAnimationViewController.h"
#import "MGBoxKit/MGBox.h"
#import "MGBoxKit/MGScrollView.h"
#import "ZipArchive/ZipArchive.h"
#import "Bee_Sandbox.h"
#import "testImageViewControllerTable.h"
#import "LoginViewController.h"
#import "ZXingObjc/ZXCapture.h"
#import "ZXingObjc/ZXBarcodeFormat.h"
#import "ZXingObjc/ZXResult.h"
#import "WebViewRootController.h"


#import <AVOSCloud/AVOSCloud.h>
#import "AutoCycleScrollViewContrtoller.h"
#import "DataSaveListViewController.h"
#import "ObjcDemoViewController.h"
#import "DeepLinkListViewController.h"
#import "OpenURLViewController.h"
#import "PriceTotalViewController.h"

//////////////////UIViewController////////////////
#import "networkDemoViewController.h"

@interface Tab1ViewController ()
@property (strong, nonatomic) ZXCapture *capture;
@property (strong, nonatomic) UILabel *barcode;
@property (strong, nonatomic) UITextField *price;
@property (strong, nonatomic) UITextField *shop;
@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) NSString *firstName;
@end

@implementation Tab1ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    _firstName = @"Wei";
    //test
    NSString * __weak string = [[NSString alloc] initWithFormat:@"First name: %@",[self firstName]];
    NSLog(@"string: %@",string);
    //test
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
    label.text = @"异步加载100张图片-MGBOX";
    [box addSubview:label];
    box.onTap = ^{
        testImageViewController *testImageViewC = [[testImageViewController alloc] init];
        [self.navigationController pushViewController:testImageViewC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"超市帮手";
    [box addSubview:label];
    box.onTap = ^{
        PriceTotalViewController  *priceTotalViewC = [[PriceTotalViewController alloc] init];
        [self.navigationController pushViewController:priceTotalViewC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"网络";
    box.onTap = ^{
        networkDemoViewController *networkVC = [[networkDemoViewController alloc] init];
        [self.navigationController pushViewController:networkVC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"异步加载100张图片-Table";
    [box addSubview:label];
    box.onTap = ^{
        testImageViewControllerTable *testImageViewC = [[testImageViewControllerTable alloc] init];
        [self.navigationController pushViewController:testImageViewC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.text = @"AFNetWorking发起请求";
    label.backgroundColor = [UIColor greenColor];
    [box addSubview:label];
    box.onTap = ^{
        testAFNetworkingViewC *testAFNetworking = [[testAFNetworkingViewC alloc] init];
        [self.navigationController pushViewController:testAFNetworking animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.text = @"动画";
    label.backgroundColor = [UIColor greenColor];
    [box addSubview:label];
    box.onTap = ^{
        testAnimationViewController *testAnimation = [[testAnimationViewController alloc] init];
        [self.navigationController pushViewController:testAnimation animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.text = @"zip解压";
    label.backgroundColor = [UIColor greenColor];
    [box addSubview:label];
    box.onTap = ^{
        ZipArchive *ziparchive = [[ZipArchive alloc] init];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"zip"];
        BOOL nRet = [ziparchive UnzipOpenFile:filePath];
        NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *downloadPath = [cacheDirectory stringByAppendingPathComponent:@"demo"];
        BOOL nRet1 = [ziparchive UnzipFileTo:downloadPath overWrite:YES];
        NSInteger a = 0;
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.text = @"图片轮播";
    label.backgroundColor = [UIColor greenColor];
    [box addSubview:label];
    box.onTap = ^{
        AutoCycleScrollViewContrtoller *autoScrollVC = [[AutoCycleScrollViewContrtoller alloc] init];
        [self.navigationController pushViewController:autoScrollVC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    
    box = [MGBox box];
    box.backgroundColor = [UIColor greenColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    box.onTap = ^{
        LoginViewController *vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor blueColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *scanlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    scanlabel.text = @"扫描条形码";
    [box addSubview:scanlabel];
    box.onTap = ^{
        self.capture = [[ZXCapture alloc] init];
        self.capture.camera = self.capture.back;
        self.capture.focusMode = AVCaptureFocusModeContinuousAutoFocus;
        self.capture.rotation = 90.0f;
        
        self.capture.layer.frame = self.view.bounds;
        self.capture.delegate = self;
        [self.capture start];
        [self.view.layer addSublayer:self.capture.layer];

    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 100);
    _barcode = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    _barcode.backgroundColor = [UIColor whiteColor];
    [box addSubview:_barcode];
    
    _price = [[UITextField alloc] initWithFrame:CGRectMake(210, 0, 50, 30)];
    _price.backgroundColor = [UIColor whiteColor];
    [box addSubview:_price];
    
    _shop = [[UITextField alloc] initWithFrame:CGRectMake(270, 0, 100, 30)];
    _shop.backgroundColor = [UIColor whiteColor];
    [box addSubview:_shop];
    
    UIButton *queryBtn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 100, 40)];
    queryBtn.backgroundColor = [UIColor greenColor];
    [queryBtn setTitle:@"查询" forState:UIControlStateNormal];
    [queryBtn bk_whenTapped:^{
        AVQuery *query = [AVQuery queryWithClassName:@"barcodePrice"];
        [query whereKey:@"barcode" equalTo:_barcode.text];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error ) {
                // 检索成功
                if (objects.count > 0) {
                    AVObject *result = objects[0];
                    
                    _price.text = [NSString stringWithFormat:@"%@",[result objectForKey:@"price"]];
                    NSString *shopName = [result objectForKey:@"shop"];
                    if (shopName == nil || [shopName isEqualToString:@""]) {
                        shopName = @"好又多";
                    }
                    _shop.text = [NSString stringWithFormat:@"%@",shopName];
                    
//                    [_products addObject:[result objectForKey:@"price"]];
                }
                else
                {
                    _barcode.text = @"";
                    _price.text = @"";
                    _shop.text = @"";
                    
                    
                }
                
            } else {
                _barcode.text = @"";
                _price.text = @"";
                _shop.text = @"";
            }
        }];
        
    }];
    [box addSubview:queryBtn];
    
    UIButton *confirmBtn  = [[UIButton alloc] initWithFrame:CGRectMake(200, 40, 100, 40)];
    confirmBtn.backgroundColor = [UIColor yellowColor];
    [confirmBtn setTitle:@"提交" forState:UIControlStateNormal];
    [confirmBtn bk_whenTapped:^{
        if ([_barcode.text isEqualToString:@""]||[_price.text isEqualToString:@""]||[_shop.text isEqualToString:@""] ) {
            
        }
        else
        {
            AVObject *testObject = [AVObject objectWithClassName:@"barcodePrice"];
            [testObject setObject:_barcode.text forKey:@"barcode"];
            [testObject setObject:_price.text forKey:@"price"];
            [testObject setObject:_shop.text forKey:@"shop"];
            [testObject save];
        }
        
    }];
    [box addSubview:confirmBtn];
//    box.onTap = ^{
//    };
    [scroll.boxes addObject:box];
    
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *totalPrice = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    totalPrice.text = [self totalPrice];
    box.onTap = ^{
    };
    [scroll.boxes addObject:box];
    
    
    
    box = [MGBox box];
    box.backgroundColor = [UIColor blueColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"清除缓存";
    [box addSubview:clearCache];
    box.onTap = ^{
        WebViewRootController *testClearCacheVC = [[WebViewRootController alloc] init];
        [self.navigationController pushViewController:testClearCacheVC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    
    
    [self.view bk_whenTapped:^{
        [_shop resignFirstResponder];
        [_price resignFirstResponder];
    }];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"保存到剪贴板";
    [box addSubview:clearCache];
    box.onTap = ^{
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = @"保存到剪贴板";
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"本地存储";
    [box addSubview:clearCache];
    box.onTap = ^{
        DataSaveListViewController *dataSaveController = [[DataSaveListViewController alloc] init];
        [self.navigationController pushViewController:dataSaveController animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"DeepLink Kit";
    [box addSubview:clearCache];
    box.onTap = ^{
        DeepLinkListViewController *deeplinkVC = [[DeepLinkListViewController alloc] init];
        [self.navigationController pushViewController:deeplinkVC animated:YES];
    };
    [scroll.boxes addObject:box];

    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"objective-c";
    [box addSubview:clearCache];
    box.onTap = ^{
        ObjcDemoViewController *objcDemoVC = [[ObjcDemoViewController alloc] init];
        [self.navigationController pushViewController:objcDemoVC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    clearCache = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    clearCache.text = @"openURL";
    [box addSubview:clearCache];
    box.onTap = ^{
        OpenURLViewController *openURLVC = [[OpenURLViewController alloc] init];
        [self.navigationController pushViewController:openURLVC animated:YES];
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
