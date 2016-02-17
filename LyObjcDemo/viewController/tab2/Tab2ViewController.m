//
//  Tab2ViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 15/11/12.
//
//

#import "Tab2ViewController.h"
#import "testImageViewController.h"
#import "testAFNetworkingViewC.h"
#import "testAnimationViewController.h"
#import "MGBoxKit/MGBox.h"
#import "MGBoxKit/MGScrollView.h"
#import "ZipArchive/ZipArchive.h"
#import "Bee_Sandbox.h"


@interface Tab2ViewController ()
@property (nonatomic,retain) NSMutableArray* photos;
@property (strong, nonatomic) UIWindow *keyWindow;
@property (nonatomic, retain) UIImagePickerController *imagePicker;
@end

@implementation Tab2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.photos = [[NSMutableArray alloc] initWithCapacity:1];
    
    MGScrollView *scroll = [[MGScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = [UIColor yellowColor];
    scroll.contentLayoutMode = MGLayoutGridStyle;
    [self.view addSubview:scroll];
    
    MGBox *box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"打开相册－系统";
    [box addSubview:label];
    box.onTap = ^{
        _imagePicker = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            _imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:_imagePicker.sourceType];
        }
        _imagePicker.delegate = self;
        _imagePicker.allowsEditing = NO;
        [self presentViewController:_imagePicker animated:YES completion:nil];
    };
    [scroll.boxes addObject:box];
    
    box = [MGBox box];
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(0, 0, 320, 40);
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"打开相册－QBImagePicker";
    [box addSubview:label];
    box.onTap = ^{
        QBImagePickerController *imagePickerController = [QBImagePickerController new];
        imagePickerController.delegate = self;
        imagePickerController.allowsMultipleSelection = YES;
        imagePickerController.maximumNumberOfSelection = 6;
        imagePickerController.showsNumberOfSelectedAssets = YES;
        
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    };
    [scroll.boxes addObject:box];
    
    [scroll layout];

    
    UIButton *photoBtn = [[UIButton alloc] initWithFrame:CGRectMake(300, 400, 50, 50)];
    [photoBtn setTitle:@"photo" forState:UIControlStateNormal];
    [photoBtn bk_whenTapped:^{
        NSLog(@"照片浏览");
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if(authStatus == AVAuthorizationStatusDenied){
            //没有使用权限
            NSLog(@"没有使用权限");
        }
        
        MWPhoto *photo;
        
        // Photos
        photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo5" ofType:@"jpg"]]];
        photo.caption = @"Fireworks";
        [_photos addObject:photo];
        photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo2" ofType:@"jpg"]]];
        photo.caption = @"The London Eye is a giant Ferris wheel situated on the banks of the River Thames, in London, England.";
        [_photos addObject:photo];
        photo = [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"photo3" ofType:@"jpg"]]];
        photo.caption = @"York Floods";
        [_photos addObject:photo];
        photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photo4" ofType:@"jpg"]]];
        photo.caption = @"Campervan";
        [_photos addObject:photo];
        // Options
        
        // Create browser (must be done each time photo browser is
        // displayed. Photo browser objects cannot be re-used)
        MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        
        browser.displayActionButton = YES;
        browser.displayNavArrows = YES;
        browser.displaySelectionButtons = NO;
        browser.alwaysShowControls = NO;
        browser.wantsFullScreenLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = NO;
        browser.startOnGrid = NO;
        
        [self.navigationController pushViewController:browser animated:YES];
    }];
    [self.view addSubview:photoBtn];
    
}
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets {
    for (PHAsset *asset in assets) {
        // Do something with the asset
        
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    /*添加处理选中图像代码*/
    NSLog([image description],nil);
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    /*添加代码，处理选中图像又取消的情况*/
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}
- (UIWindow *)keyWindow
{
    if(_keyWindow == nil)
    {
        _keyWindow = [[UIApplication sharedApplication] keyWindow];
    }
    
    return _keyWindow;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return self.photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < self.photos.count) {
        return [self.photos objectAtIndex:index];
    }
    return nil;
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
