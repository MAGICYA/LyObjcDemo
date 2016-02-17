//
//  Product.h
//  LyObjcDemo
//
//  Created by wly1 on 16/1/26.
//
//

#import "BaseModel.h"

@interface Product : BaseModel
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productBarCode;
@property (strong, nonatomic) NSString *productPrice;
@property (assign, nonatomic) NSInteger productCount;
@property (strong, nonatomic) NSString *shoppingID;
@property (strong, nonatomic) NSString *shoppingName;
@end
