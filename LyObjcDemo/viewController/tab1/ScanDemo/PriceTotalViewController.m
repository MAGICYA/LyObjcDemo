//
//  PriceTotalViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/2.
//
//

#import "PriceTotalViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import <AVOSCloud/AVOSCloud.h>

#define HeightOfScrollList 400

@interface PriceTotalViewController ()
@property (strong, nonatomic) Product *currentProduct;
@property (strong, nonatomic) NSMutableArray *ProductList;
@property (strong, nonatomic) UITableView *productListTable;
@property (strong, nonatomic) ZXCapture *capture;
@property (strong, nonatomic) UILabel *totalPrice;
@property (strong, nonatomic) UITextView *barCode;
@property (strong, nonatomic) UITextView *productName;
@property (strong, nonatomic) UITextView *productPrice;
@property (strong, nonatomic) UITextView *productCount;
@property (strong, nonatomic) UITextView *shopName;
@property (strong, nonatomic) NSMutableArray *shopList;
@end

@implementation PriceTotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"总价";

//    //tmp
    _ProductList = [[NSMutableArray alloc] initWithCapacity:20];
//    for (int i = 0; i< 20; i++) {
//        Product *tmpProduct = [[Product alloc] init];
//        NSString *tmpString = [NSString stringWithFormat:@"%d%d%d%d%d",i,i,i,i,i];
//        tmpProduct.productName = tmpString;
//        tmpProduct.productBarCode = tmpString;
//        tmpProduct.productPrice = tmpString;
//        [_ProductList addObject:tmpProduct];
//    }
//    //tmp
    
    [self queryShopList];
    
    MGScrollView *scrollList = [[MGScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollList.backgroundColor = [UIColor yellowColor];
    scrollList.contentLayoutMode = MGLayoutGridStyle;
    [self.view addSubview:scrollList];
    
    
    
    MGBox *box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    _totalPrice = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    _totalPrice.backgroundColor = [UIColor greenColor];
    _totalPrice.text = [NSString stringWithFormat:@"总价：%f",[self calcuTotalPrice]];
    [box addSubview:_totalPrice];
    box.onTap = ^{
        
    };
    [scrollList.boxes addObject:box];
    
    

    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 50);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 50)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"扫描条形码";
    [box addSubview:label];
    box.onTap = ^{
        if (self.capture == nil) {
            self.capture = [[ZXCapture alloc] init];
            self.capture.camera = self.capture.back;
            self.capture.focusMode = AVCaptureFocusModeContinuousAutoFocus;
            self.capture.rotation = 90.0f;
            
            self.capture.layer.frame = self.view.bounds;
            self.capture.delegate = self;
        }
        else
        {
            if (self.capture.layer.superlayer == nil) {
                [self.view.layer addSublayer:self.capture.layer];
            }
            [self.capture start];
        }
        
        
    };
    [scrollList.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 50);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 50)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"条形码";
    [box addSubview:label];
    
    _barCode = [[UITextView alloc] initWithFrame:CGRectMake(150, 5, 200, 50)];
    _barCode.backgroundColor = [UIColor greenColor];
    _barCode.keyboardType = UIKeyboardTypeDecimalPad;
    [box addSubview:_barCode];
    [scrollList.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 50);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 50)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"价格";
    [box addSubview:label];
    
    _productPrice = [[UITextView alloc] initWithFrame:CGRectMake(150, 5, 200, 50)];
    _productPrice.backgroundColor = [UIColor greenColor];
    _productPrice.keyboardType = UIKeyboardTypeDecimalPad;
    [box addSubview:_productPrice];
    [scrollList.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 50);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 50)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"姓名";
    [box addSubview:label];
    
    _productName = [[UITextView alloc] initWithFrame:CGRectMake(150, 5, 200, 50)];
    _productName.backgroundColor = [UIColor greenColor];
    
    [box addSubview:_productName];
    [scrollList.boxes addObject:box];

    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 50);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 50)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"数量";
    [box addSubview:label];
    
    _productCount = [[UITextView alloc] initWithFrame:CGRectMake(150, 5, 200, 50)];
    _productCount.backgroundColor = [UIColor greenColor];
    _productCount.text = @"1";
    _productCount.keyboardType = UIKeyboardTypeDecimalPad;
    [box addSubview:_productCount];
    [scrollList.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 50);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 50)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"商场";
    [box addSubview:label];
    
    _shopName = [[UITextView alloc] initWithFrame:CGRectMake(150, 5, 200, 50)];
    _shopName.backgroundColor = [UIColor greenColor];
    
    [box addSubview:_shopName];
    [scrollList.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 50);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 50)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"保存";
    [box addSubview:label];
    box.onTap = ^{
        [self saveConfirm];
        
    };
    [scrollList.boxes addObject:box];

    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, SCREEN_WIDTH, HeightOfScrollList);
    _productListTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 2*10, HeightOfScrollList)];
    _productListTable.delegate = self;
    _productListTable.dataSource = self;
    [box addSubview:_productListTable];
    [scrollList.boxes addObject:box];
    
    
    [scrollList layout];
    
    [self.view bk_whenTapped:^{
        [_barCode resignFirstResponder];
        [_productName resignFirstResponder];
        [_productPrice resignFirstResponder];
        [_productCount resignFirstResponder];
        [_shopName resignFirstResponder];
    }];
}
-(void)queryShopList{
    AVQuery *query = [AVQuery queryWithClassName:@"ShopInfo"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            _shopList = [NSMutableArray arrayWithArray:objects];
        } else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    return;
}
-(void)saveConfirm{
    BOOL isFind = NO;
    for (Product* tmpProduct in _ProductList) {
        if ([tmpProduct.productBarCode isEqualToString:_barCode.text]) {
            isFind = YES;
            tmpProduct.productCount += [_productCount.text integerValue];
            break;
        }
    }
    if (isFind == NO) {
        Product *tmpProduct = [[Product alloc] init];
        tmpProduct.productBarCode = _barCode.text;
        tmpProduct.productName = _productName.text;
        tmpProduct.productPrice = _productPrice.text;
        tmpProduct.productCount = [_productCount.text integerValue];
        [_ProductList addObject:tmpProduct];
    }
   
    _totalPrice.text = [NSString stringWithFormat:@"%f",[self calcuTotalPrice]];
    [_productListTable reloadData];
    return;
}
-(CGFloat)calcuTotalPrice{
    CGFloat totalPrice = 0.0;
    for (Product *tmpProduct in _ProductList) {
        totalPrice += [tmpProduct.productPrice floatValue] * tmpProduct.productCount;
    }
    return totalPrice;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_ProductList count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ProductCell *cell = (ProductCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setCellData:(id)(_ProductList[indexPath.row])];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - ZXCaptureDelegate Methods
//结果回调：

- (NSString *)barcodeFormatToString:(ZXBarcodeFormat)format {
    switch (format) {
        case kBarcodeFormatAztec:
            return @"Aztec";
            
        case kBarcodeFormatCodabar:
            return @"CODABAR";
            
        case kBarcodeFormatCode39:
            return @"Code 39";
            
        case kBarcodeFormatCode93:
            return @"Code 93";
            
        case kBarcodeFormatCode128:
            return @"Code 128";
            
        case kBarcodeFormatDataMatrix:
            return @"Data Matrix";
            
        case kBarcodeFormatEan8:
            return @"EAN-8";
            
        case kBarcodeFormatEan13:
            return @"EAN-13";
            
        case kBarcodeFormatITF:
            return @"ITF";
            
        case kBarcodeFormatPDF417:
            return @"PDF417";
            
        case kBarcodeFormatQRCode:
            return @"QR Code";
            
        case kBarcodeFormatRSS14:
            return @"RSS 14";
            
        case kBarcodeFormatRSSExpanded:
            return @"RSS Expanded";
            
        case kBarcodeFormatUPCA:
            return @"UPCA";
            
        case kBarcodeFormatUPCE:
            return @"UPCE";
            
        case kBarcodeFormatUPCEANExtension:
            return @"UPC/EAN extension";
            
        default:
            return @"Unknown";
    }
}

- (void)captureResult:(ZXCapture *)capture result:(ZXResult *)result {
    if (!result) return;
    
    // We got a result. Display information about the result onscreen.
    NSString *formatString = [self barcodeFormatToString:result.barcodeFormat];
    NSString *display = [NSString stringWithFormat:@"Scanned!\n\nFormat: %@\n\nContents:\n%@", formatString, result.text];
    //    [self.decodedLabel performSelectorOnMainThread:@selector(setText:) withObject:display waitUntilDone:YES];
    
    _barCode.text = result.text;
    [self.capture.layer removeFromSuperlayer];
    // Vibrate
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
