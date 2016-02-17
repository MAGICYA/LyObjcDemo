//
//  BlockTestViewController.h
//  LyObjcDemo
//
//  Created by wly1 on 16/2/1.
//
//

#import "LyViewController.h"

typedef void(^TestBlock1)(void);

@interface BlockTestViewController : LyViewController
@property (copy, nonatomic) TestBlock1 testBlock1;
@end
