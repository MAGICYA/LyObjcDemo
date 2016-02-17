//
//  ObjcDemoViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/1.
//
//

#import "ObjcDemoViewController.h"
#import "BlockTestViewController.h"

typedef void(^TestBlock1)(void);

@interface ObjcDemoViewController ()
@property (copy, nonatomic) TestBlock1 copyBlock;
@property (weak, nonatomic) TestBlock1 weakBlock;
@property (weak, nonatomic) TestBlock1 returnBlock;
@property (assign, nonatomic) NSInteger propertyIndex;
@end

@implementation ObjcDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"objc Demo";
    MGScrollView *scroll = [[MGScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = [UIColor yellowColor];
    scroll.contentLayoutMode = MGLayoutGridStyle;
    [self.view addSubview:scroll];
    
//    __block NSInteger tempIndex = 0;
    NSInteger tempIndex = 0;
    _propertyIndex = 0;
    __weak ObjcDemoViewController *weakself = self;
    _copyBlock = ^(){
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:weakself.view
                                                  animated:YES];
        hud.minShowTime = 1.0;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = [NSString stringWithFormat:@"copyBlock propertyIndex = %ld",_propertyIndex];
        NSLog([NSString stringWithFormat:@"copyBlock propertyIndex = %ld",_propertyIndex],nil);
//        hud.labelText = [NSString stringWithFormat:@"copyBlock tempIndex = %ld",tempIndex];
//        NSLog([NSString stringWithFormat:@"copyBlock tempIndex = %ld",tempIndex],nil);
        [hud showAnimated:YES whileExecutingBlock:^{
            
        }];
    };
    TestBlock1 copyCopyBlock = [_copyBlock copy];
    _weakBlock = ^(){
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:weakself.view
                                                  animated:YES];
        hud.minShowTime = 1.0;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = [NSString stringWithFormat:@"weakBlock propertyIndex = %ld",_propertyIndex];
        NSLog([NSString stringWithFormat:@"weakBlock propertyIndex = %ld",_propertyIndex],nil);
//        hud.labelText = [NSString stringWithFormat:@"weakBlock tempIndex = %ld",tempIndex];
//        NSLog([NSString stringWithFormat:@"weakBlock tempIndex = %ld",tempIndex],nil);
        [hud showAnimated:YES whileExecutingBlock:^{
            
        }];
    };
    
    //临时变量，需要声明__block前缀，否则只是对变量的拷贝，且不能修改。
//    if (_weakBlock) {
//        _weakBlock();   //0   ,__block 0
//    }
//    tempIndex ++;
//    if (_weakBlock) {
//        _weakBlock();   //0   ,__block 1
//    }
//    
//    tempIndex = 0;
//    if (_copyBlock) {
//        _copyBlock();   //0   ,__block 0
//    }
//    tempIndex ++;
//    if (_copyBlock) {
//        _copyBlock();   //0   ,__block 1
//    }
    
    //成员变量不需要声明__block前缀
    if (_weakBlock) {
        _weakBlock();   //0
    }
    _propertyIndex ++;
    if (_weakBlock) {
        _weakBlock();   //1
    }
    
    _propertyIndex = 0;
    if (_copyBlock) {
        _copyBlock();   //0
    }
    _propertyIndex ++;
    if (_copyBlock) {
        _copyBlock();   //1
    }
    
//    TestBlock1 tmpReturnBlock = [self createWeakBlock];
//    if (tmpReturnBlock) {
//        tmpReturnBlock();
//    }
    
    _returnBlock = [self createWeakBlock];
    
    MGBox *box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"block";
    [box addSubview:label];
    box.onTap = ^{
        BlockTestViewController *blockTestVC = [[BlockTestViewController alloc] init];
        blockTestVC.testBlock1 = _weakBlock;
        [self.navigationController pushViewController:blockTestVC animated:YES];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    [btn setTitle:@"execute self function executeWeakBlock" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(executeWeakBlock) forControlEvents:UIControlEventTouchUpInside];
    [box addSubview:btn];
    
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    [btn setTitle:@"execute self function executeCopyBlock" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(executeCopyBlock) forControlEvents:UIControlEventTouchUpInside];
    [box addSubview:btn];
    
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    [btn setTitle:@"execute self function executeReturnBlock" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(executeReturnBlock) forControlEvents:UIControlEventTouchUpInside];
    [box addSubview:btn];
    
    [scroll.boxes addObject:box];
    
    [scroll layout];

}
-(void)executeWeakBlock{
    if (_weakBlock) {//若类属性Block内存规则为weak，那么超过定义域后，rightBlock会被释放。在这一行引用_weakBlock则会引起闪退
        _weakBlock();
    }
    return;
}
-(void)executeCopyBlock{
    if (_copyBlock) {
        _copyBlock();
    }
    return;
}
-(void)executeReturnBlock{
    if (_returnBlock) {
        _returnBlock();
    }
    return;
}
-(TestBlock1)createWeakBlock{
    TestBlock1 returnWeakBlock = ^{
        NSLog([NSString stringWithFormat:@"weakBlock propertyIndex = %ld",++self.propertyIndex],nil);
    };
    return returnWeakBlock;
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
