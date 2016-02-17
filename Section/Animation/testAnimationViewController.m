//
//  testAnimationViewController.m
//  LyObjcDemo
//
//  Created by wly1 on 15/11/2.
//
//

#import "testAnimationViewController.h"
//#import "pop/POPSpringAnimation.h"
//#import "pop/POPDecayAnimation.h"
#import "BlocksKit/BlocksKit+UIKit.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface testAnimationViewController ()
@property (nonatomic,retain) UIImageView *image;
@property (nonatomic,retain) UILabel *label123;
@end

@implementation testAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    
//    MGScrollView *scroll = [[MGScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
//    
//    scroll.backgroundColor = [UIColor yellowColor];
//    
//    scroll.contentLayoutMode = MGLayoutGridStyle;
//    
//    [self.view addSubview:scroll];
//    
//    
//    
//    MGBox *box = [MGBox box];
//    box.backgroundColor = [UIColor redColor];
//    box.frame = CGRectMake(0, 0, 320, 40);
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 30)];
//    label.backgroundColor = [UIColor greenColor];
//    label.text = @"kPOPLayerX 100-40";
//    [box addSubview:label];
//    box.onTap = ^{
//        NSLog(@"kPOPLayerPositionX ");
//        if (label.center.x < 320 / 2) {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(200, 0, 200, 30)];
//            anim.springSpeed = 100.f;
//            anim.springBounciness = 40.f;
//            [label pop_addAnimation:anim forKey:@"size2"];
//        }
//        else
//        {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(70, 0, 200, 30)];
//            anim.springSpeed = 1.f;
//            anim.springBounciness = 1.f;
//            [label pop_addAnimation:anim forKey:@"size1"];
//            
//        }
//    };
//    [scroll.boxes addObject:box];
//    
//    
//    box = [MGBox box];
//    box.backgroundColor = [UIColor redColor];
//    box.frame = CGRectMake(0, 0, 320, 40);
//    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 30)];
//    label.backgroundColor = [UIColor greenColor];
//    label.text = @"kPOPLayerX 100-10";
//    [box addSubview:label];
//    box.onTap = ^{
//        NSLog(@"kPOPLayerPositionX ");
//        if (label.center.x < 320 / 2) {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(200, 0, 200, 30)];
//            anim.springSpeed = 100.f;
//            anim.springBounciness = 10.f;
//            [label pop_addAnimation:anim forKey:@"size2"];
//        }
//        else
//        {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(70, 0, 200, 30)];
//            anim.springSpeed = 1.f;
//            anim.springBounciness = 1.f;
//            [label pop_addAnimation:anim forKey:@"size1"];
//            
//        }
//
//    };
//    [scroll.boxes addObject:box];
//    
//    
//    
//    box = [MGBox box];
//    box.backgroundColor = [UIColor redColor];
//    box.frame = CGRectMake(0, 0, 320, 40);
//    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 30)];
//    label.backgroundColor = [UIColor greenColor];
//    label.text = @"kPOPLayerX 100-100";
//    [box addSubview:label];
//    box.onTap = ^{
//        NSLog(@"kPOPLayerPositionX ");
//        if (label.center.x < 320 / 2) {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(200, 0, 200, 30)];
//            anim.springSpeed = 100.f;
//            anim.springBounciness = 100.f;
//            [label pop_addAnimation:anim forKey:@"size2"];
//        }
//        else
//        {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(70, 0, 200, 30)];
//            anim.springSpeed = 1.f;
//            anim.springBounciness = 1.f;
//            [label pop_addAnimation:anim forKey:@"size1"];
//            
//        }
//        
//    };
//    [scroll.boxes addObject:box];
//    
//    
//    box = [MGBox box];
//    box.backgroundColor = [UIColor redColor];
//    box.frame = CGRectMake(0, 0, 320, 40);
//    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 30)];
//    label.backgroundColor = [UIColor greenColor];
//    label.text = @"kPOPLayerX 100-100";
//    [box addSubview:label];
//    box.onTap = ^{
//        NSLog(@"kPOPLayerPositionX ");
//        if (label.center.x < 320 / 2) {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(200, 0, 200, 30)];
//            anim.springSpeed = 100.f;
//            anim.springBounciness = 100.f;
//            [label pop_addAnimation:anim forKey:@"size2"];
//        }
//        else
//        {
//            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//            anim.toValue = [NSValue valueWithCGRect:CGRectMake(70, 0, 200, 30)];
//            anim.springSpeed = 1.f;
//            anim.springBounciness = 1.f;
//            [label pop_addAnimation:anim forKey:@"size1"];
//            
//        }
//        
//    };
//    [scroll.boxes addObject:box];
//    
//    
//    box = [MGBox box];
//    box.backgroundColor = [UIColor redColor];
//    box.frame = CGRectMake(0, 0, 320, 80);
//    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 30)];
//    [label1 setBackgroundColor:[UIColor redColor]];
//    [box addSubview:label1];
//    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 200, 30)];
//    label2.backgroundColor = [UIColor greenColor];
//    label2.text = @"color";
////    [label2 bk_whenDoubleTapped:^{
////        [label1 setBackgroundColor:[UIColor whiteColor]];
////    }];
//    [box addSubview:label2];
//    box.onTap = ^{
//        [label1 setBackgroundColor:[UIColor whiteColor]];
//    };
//    [scroll.boxes addObject:box];
//    
//    [scroll layout];
    
    
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [_image sd_setImageWithURL:[[NSURL alloc] initWithString:@"http://img2.mama100.com/site/mobile/share_image/201510/17916171_1446096048317_b.jpg"]];
    [_image addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getPixelColorAtLocation:)]];
    _image.userInteractionEnabled = YES;
    [self.view addSubview:_image];
    
    _label123 = [[UILabel alloc] initWithFrame:CGRectMake(0, 350, 300, 50)];
    [_label123 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_label123];
    

    testA *ac = [[testA alloc] init];
    [ac printTestGlobal];
}
-(void)test1
{
    NSLog(@"test1");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage {
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}

- (UIColor*) getPixelColorAtLocation:(id)point1 {
//    NSLog([point description]);
    CGPoint point = [point1 locationInView:_image];
    UIColor* color = nil;
    CGImageRef inImage = _image.image.CGImage;
    // Create off screen bitmap context to draw the image into. Format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
    CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
    if (cgctx == NULL) { return nil;  }
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    
    // Draw the image to the bitmap context. Once we draw, the memory
    // allocated for the context for rendering will then contain the
    // raw image data in the specified color space.
    CGContextDrawImage(cgctx, rect, inImage);
    
    // Now we can get a pointer to the image data associated with the bitmap
    // context.
    unsigned char* data = CGBitmapContextGetData (cgctx);
    if (data != NULL) {
        //offset locates the pixel in the data from x,y.
        //4 for 4 bytes of data per pixel, w is width of one row of data.
        @try {
            int offset = 4*((w*round(point.y))+round(point.x));
            NSLog(@"offset: %d", offset);
            int alpha =  data[offset];
            int red = data[offset+1];
            int green = data[offset+2];
            int blue = data[offset+3];
            NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
            color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
        }
        @catch (NSException * e) {
            NSLog(@"%@",[e reason]);
        }
        @finally {
        }
        
    }
    // When finished, release the context
    CGContextRelease(cgctx);
    // Free image data memory for the context
    if (data) { free(data); }
    
    
    _label123.backgroundColor = color;
    return color;
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
