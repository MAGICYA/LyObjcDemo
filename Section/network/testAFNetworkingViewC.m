//
//  testAFNetworkingViewC.m
//  LyObjcDemo
//
//  Created by wly1 on 15/10/30.
//
//

#import "testAFNetworkingViewC.h"
#import "AFNetworking/AFHTTPRequestOperationManager.h"
#import "AFNetworking/AFHTTPSessionManager.h"
#import "stdio.h"
#import "Bee_Sandbox.h"
#import "BaseHTTPService.h"

@interface testAFNetworkingViewC ()

@end

@implementation testAFNetworkingViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MGScrollView *scroll = [[MGScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = [UIColor yellowColor];
    scroll.contentLayoutMode = MGLayoutGridStyle;
    [self.view addSubview:scroll];
    
    __block int j = 0;
    
    MGBox *box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    box.onTap = ^{
        BaseHTTPService *service = [[BaseHTTPService alloc] init];
        NSDictionary *param = @{@"accountId":@"200000257853",
                                @"devid":@"1a5fb5184982998e89649761203b20e7",
                                @"loginTcd":@"121217",
                                @"pageNo":@"1",
                                @"pageSize":@"50",
                                @"queryType":@"all",
                                @"token":@"51287",
                                @"tsno":@"1446176184.911635"};
        [service get:@"http://192.168.115.4:9580/mobile/order/pendingOrderquerypendingOrderList.action" params:param success:^{
            NSLog(@"success");
        } fail:^{
            NSLog(@"fail");
        }];
    };
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"BaseHTTP GET";
    [box addSubview:label];
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"GET";
    [box addSubview:label];
    
    box.onTap = ^{
        NSLog(@"GET 开始");
        for (int i = 0; i < 200; i++)
        {
            NSDictionary *param = @{@"accountId":@"200000257853",
                                    @"devid":@"1a5fb5184982998e89649761203b20e7",
                                    @"loginTcd":@"121217",
                                    @"pageNo":@"1",
                                    @"pageSize":@"50",
                                    @"queryType":@"all",
                                    @"token":@"51287",
                                    @"tsno":@"1446176184.911635"};
            
            [[AFHTTPRequestOperationManager manager] GET:@"http://192.168.115.4:9580/mobile/order/pendingOrderquerypendingOrderList.action"
                                              parameters:param
                                                 success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
//                 NSLog(@"success");
                 j ++;
                 if (j == 200){
                     NSLog(@"GET 完成");
                 }
             }
                                                 failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
//                 NSLog(@"failure");
                 j ++;
                 if (j == 200){
                     NSLog(@"GET 完成");
                 }
             }];
        }
//        NSLog(@"GET 完成");
        
    };
    [scroll.boxes addObject:box];
    
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.text = @"POST";
    label.backgroundColor = [UIColor greenColor];
    [box addSubview:label];
    j = 0;
    box.onTap = ^{
        NSLog(@"GET 开始");
        for (int i = 0; i < 50; i++)
        {
            NSDictionary *param = @{@"accountId":@"200000257853",
                                    @"devid":@"1a5fb5184982998e89649761203b20e7",
                                    @"loginTcd":@"121217",
                                    @"pageNo":@"1",
                                    @"pageSize":@"50",
                                    @"queryType":@"all",
                                    @"token":@"51287",
                                    @"tsno":@"1446176184.911635"};
            
            [[AFHTTPSessionManager manager] GET:@"http://192.168.115.4:9580/mobile/order/pendingOrderquerypendingOrderList.action"
                                              parameters:param
                                                 success:^(NSURLSessionDataTask *task, id responseObject)
             {
//                                  NSLog(@"success");
                 j ++;
                 if (j == 200){
                     NSLog(@"GET 完成");
                 }
             }
                                                 failure:^(NSURLSessionDataTask *task, NSError *error)
             {
//                                  NSLog(@"failure");
                 j ++;
                 if (j == 200){
                     NSLog(@"GET 完成");
                 }
             }];
        }
        

    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 60);
    UITextView *text = [[UITextView alloc] initWithFrame:CGRectMake(20, 5, 300, 50)];
    text.text = @"结论：真机在wifi情况下，同时能处理的请求为4个NSURLConnection。 \n问题1:此次实验用的是AFNetworking，下次直接用NSURLConnection。\n 问题2:上一组请求完毕之后，要等一段时间才看到下一组请求，这是为什么？间隔期间做了什么？长达8s。是AFNetworking的漏洞吗？\n NSURLSession的并发数很高，40个并发请求。太厉害。但是AFNetworking的NSURLSession容易丢请求，如果并发的请求太多，后面的请求容易被丢掉。以致于漏请求。";
    text.backgroundColor = [UIColor greenColor];
    [box addSubview:text];
    [scroll.boxes addObject:box];
    
    //http://apkprd.b0.upaiyun.com/soft/h5/zips/home448.zip
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 100);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 50)];
    label.text = @"NSURLConnection断点续传";
    label.backgroundColor = [UIColor greenColor];
    [box addSubview:label];
    
    UIButton *beginBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, 50, 30)];
    [beginBtn setTitle:@"开始" forState:UIControlStateNormal];
    [beginBtn bk_whenTapped:^{
        NSLog(@"beginBtn");
//        NSURL *url1=[NSURL URLWithString:@"http://apkprd.b0.upaiyun.com/soft/h5/zips/home448.zip"];
//        NSMutableURLRequest* request1=[NSMutableURLRequest requestWithURL:url1];
//        [request1 setValue:@"bytes=20000-" forHTTPHeaderField:@"Range"];
//        [request1 setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//        NSData *returnData1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:nil error:nil];
//        [self writeToFile:returnData1 fileName:@"tmpFile1"];
        NSString *downloadUrl = @"http://apkprd.b0.upaiyun.com/soft/h5/zips/home448.zip";
        NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *downloadPath = [cacheDirectory stringByAppendingPathComponent:@"home448.zip"];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:downloadUrl]];
        //检查文件是否已经下载了一部分
        unsigned long long downloadedBytes = 0;
        if ([[NSFileManager defaultManager] fileExistsAtPath:downloadPath]) {
            //获取已下载的文件长度
            downloadedBytes = [self fileSizeForPath:downloadPath];
            if (downloadedBytes > 0) {
                NSMutableURLRequest *mutableURLRequest = [request mutableCopy];
                NSString *requestRange = [NSString stringWithFormat:@"bytes=%llu-", downloadedBytes];
                [mutableURLRequest setValue:requestRange forHTTPHeaderField:@"Range"];
                request = mutableURLRequest;
            }
        }
        //不使用缓存，避免断点续传出现问题
        [[NSURLCache sharedURLCache] removeCachedResponseForRequest:request];
        //下载请求
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        __weak AFHTTPRequestOperation *weakOperation = operation;
        //下载路径
        operation.outputStream = [NSOutputStream outputStreamToFileAtPath:downloadPath append:YES];
        //下载进度回调
        [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
            //下载进度
            if (([self fileSizeForPath:downloadPath]  - downloadedBytes)> (1024*400)) {
                NSLog(@"totalBytesRead  - downloadedBytes = %lld , then cancel", [self fileSizeForPath:downloadPath]  - downloadedBytes);
                [weakOperation cancel];
            }
        }];
        //成功和失败回调
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"complete success");
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"complete failure %@",error);
        }];  
        [operation start];
        
    }];
    [box addSubview:beginBtn];
    
    UIButton *pauseBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 60, 50, 30)];
    [pauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    [pauseBtn bk_whenTapped:^{
        NSLog(@"pauseBtn");
    }];
    [box addSubview:pauseBtn];
    
    UIButton *continueBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 60, 50, 30)];
    [continueBtn setTitle:@"继续" forState:UIControlStateNormal];
    [continueBtn bk_whenTapped:^{
        NSLog(@"continueBtn");

    }];
    [box addSubview:continueBtn];
    [scroll.boxes addObject:box];
    
    
    
    [scroll layout];
    
}
//获取已下载的文件大小
- (unsigned long long)fileSizeForPath:(NSString *)path {
    signed long long fileSize = 0;
    NSFileManager *fileManager = [NSFileManager new]; // default is not thread safe
    if ([fileManager fileExistsAtPath:path]) {
        NSError *error = nil;
        NSDictionary *fileDict = [fileManager attributesOfItemAtPath:path error:&error];
        if (!error && fileDict) {
            fileSize = [fileDict fileSize];
        }
    }
    return fileSize;
}
-(void)writeToFile:(NSData *)data fileName:(NSString *) fileName
{
    NSFileManager  *manager =  [NSFileManager defaultManager];
    NSString *docPath = [BeeSandbox docPath];
    NSString *filePath = [docPath stringByAppendingPathComponent:fileName];
    
    BOOL nRet;
    if([manager fileExistsAtPath:filePath] == NO){
        NSLog(@"file not exist,create it...");
        nRet = [manager createFileAtPath:filePath contents:data attributes:nil];
    }else {
        NSLog(@"file exist!!!");
    }
    
    FILE *file = fopen([fileName UTF8String], "r");
    
    if(file != NULL){
        fseek(file, 0, SEEK_END);
    }
    else
    {
        return;
    }
    int readSize = (int)[data length];
    
    fwrite((const void *)[data bytes], readSize, 1, file);
    fclose(file);
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
