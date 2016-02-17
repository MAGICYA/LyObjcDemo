//
//  networkASIDemoViewController.m
//  LyObjcDemo
//
//  Created by walson-mac on 16/2/14.
//
//

#import "networkASIDemoViewController.h"
#import "MGBoxKit/MGBox.h"
#import "MGBoxKit/MGScrollView.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@interface networkASIDemoViewController ()

@end

@implementation networkASIDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    label.text = @"HTTP-GET";
    [box addSubview:label];
    box.onTap = ^{
        ASIFormDataRequest *getRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://h.mama100.com/mobile/login/v2loginActionlogin.action?opno=13800138000&width=640&brand=Apple&os=iOS&devid=a903ba2f3ceabd9fc9550b1d7539f9ac&dpi=326&ver=25&height=1136&pwd=3472f86b53ea536fd47d3aa8a212d1ea&osver=9.2&vernm=5.1.0&model=x86_64&tsno=1455462422.872019"]];
        getRequest.requestMethod = @"GET";
        __weak ASIFormDataRequest *weakGetRequest = getRequest;
        [getRequest setCompletionBlock:^{
            NSLog(@"completion %@",weakGetRequest.responseString);
        }];
        [getRequest setFailedBlock:^{
            NSLog(@"fail %@",weakGetRequest.error);
        }];
        [getRequest startAsynchronous];
        
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"CFStream Read";
    [box addSubview:label];
    box.onTap = ^{
        NSURL *fileURL = [NSURL URLWithString:@"file:///Users/joeuser/Downloads/MyApp.sit"];
        CFReadStreamRef myReadStream = CFReadStreamCreateWithFile(kCFAllocatorDefault, (CFURLRef)fileURL);
        if(!CFReadStreamOpen(myReadStream))
        {
            CFStreamError myErr = CFReadStreamGetError(myReadStream);
            if (myErr.domain == kCFStreamErrorDomainPOSIX) {
                
            }
            else if (myErr.error == kCFStreamErrorDomainMacOSStatus)
            {
                
            }
            else
            {
                
            }
        }
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
