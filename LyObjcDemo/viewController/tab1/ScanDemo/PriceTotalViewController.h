//
//  PriceTotalViewController.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/2.
//
//

#import "LyViewController.h"
#import "ZXingObjc/ZXCapture.h"
#import "ZXingObjc/ZXBarcodeFormat.h"
#import "ZXingObjc/ZXCaptureDelegate.h"
#import "ZXingObjc/ZXResult.h"

@interface PriceTotalViewController : LyViewController <UITableViewDataSource,UITableViewDelegate,ZXCaptureDelegate>

@end
