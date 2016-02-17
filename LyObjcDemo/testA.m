//
//  testA.m
//  LyObjcDemo
//
//  Created by wly1 on 15/11/30.
//
//

#import "testA.h"

BOOL testGlobal = YES;


@interface testA()
@property (nonatomic,retain) NSDictionary *dicAtInterfacem;
@end

@implementation testA
-(id)init
{
    self = [super self];
    if(self)
    {
        _dicAtInterface = @{@"age" : @28};
        _dicAtInterfacem = @{@"firstName" : @"Matt",
                            @"lastName" : @"Galloway"};
    }
    return self;
}
-(void)func
{
    testGlobal = NO;
    [self printTestGlobal];
}

-(void)printTestGlobal
{
    NSLog(@"testGlobal = %d %x",testGlobal,&testGlobal);
}
@end
