//
//  AutoCycleScrollViewContrtoller.m
//  LyObjcDemo
//
//  Created by wly1 on 16/1/14.
//
//

#import "AutoCycleScrollViewContrtoller.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface AutoCycleScrollViewContrtoller ()

@end

@implementation AutoCycleScrollViewContrtoller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *ImgsArray = [[NSMutableArray alloc] init];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor]];
    for (int i = 0; i < [colorArray count]; ++i) {
        UIImage *tempImg = [self imageWithColor:colorArray[i] size:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
        [ImgsArray addObject:tempImg];
    }
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 300) imagesGroup:ImgsArray];
    [self.view addSubview:cycleScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage*)imageWithColor:(UIColor *)color size:(CGSize)size
{
    @autoreleasepool
    {
        CGRect rect = CGRectMake( 0 , 0 , size.width , size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
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
