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

#import "LoginApi.h"
#import "LoginModel.h"

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
    label.text = @"LyRequest-GET";
    [box addSubview:label];
    box.onTap = ^{
        LoginApi *loginApi = [[LoginApi alloc] init];
        loginApi.successBlock = ^(id data){
            DDLogInfo(@"LgoinApi Success \n %@",data);
            //JSONModel
            LoginmobResponse *req = [[LoginmobResponse alloc] initWithString:data error:nil];
            for (LoginModel *p in req.mobResponse.tmls) {
                DDLogInfo(@"LgoinApi Success  %@",p.tn);
            }
            //JSONModel
        };
        loginApi.failBlock = ^(id data){
            DDLogInfo(@"LgoinApi fail \n %@",data);
        };
        [loginApi LoginApiWithUserName:@"13800138000" passWord:@"win100"];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"ASI HTTP Post Syn";
    [box addSubview:label];
    box.onTap = ^{
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.115.4:9580/mobile/myterminal/terminalAccount.action"]];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        [request setRequestMethod:@"POST"];
       
        
        [request setPostValue:@"7c3f9a38cf36941fee1f200a7c48ad78" forKey:@"devid"];
        [request setPostValue:@"ea3b3ac8744b1da928a0d5acd4790cef" forKey:@"token"];
        [request setPostValue:@"199999" forKey:@"loginTcd"];
        [request setPostValue:@"1455768018.004683" forKey:@"tsno"];
        [request setPostValue:@"200000101126" forKey:@"accountId"];
        [request setPostValue:@"1" forKey:@"pageNo"];
        [request setPostValue:@"20" forKey:@"pageSize"];
        [request setPostValue:@"" forKey:@"tcd"];
        [request setPostValue:@"" forKey:@"type"];
//        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//        [dict setObject:[self getStringIgnoreNil:tcd] forKey:@"tcd"];
//        [dict setObject:[self getStringIgnoreNil:type] forKey:@"type"];
//        [dict setObject:[self getStringIgnoreNil:pageNo] forKey:@"pageNo"];
//        [dict setObject:[self getStringIgnoreNil:pageSize] forKey:@"pageSize"];
        
        [request startSynchronous];
        NSError *error = [request error];
        if (error) {
            NSLog(@"error：%@",error);
        }
        else
        {
            NSLog(@"complete : %@",request.responseString);
        }
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
