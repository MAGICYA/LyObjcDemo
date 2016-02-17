//
//  ProductCell.m
//  LyObjcDemo
//
//  Created by wly1 on 16/2/2.
//
//

#import "ProductCell.h"
#import "Product.h"

@interface ProductCell ()
@property (strong, nonatomic) UILabel *productNameLabel;
@property (strong, nonatomic) UILabel *productPriceLabel;
@end

@implementation ProductCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _productNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        [self.contentView addSubview:_productNameLabel];
        
        _productPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 100, 30)];
        [self.contentView addSubview:_productPriceLabel];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellData:(id)cellData{
    if ([cellData isKindOfClass:[Product class]]) {
        Product *tmpProduct = (Product*)cellData;
        _productNameLabel.text = tmpProduct.productName;
        _productPriceLabel.text = [NSString stringWithFormat:@"%@ x %ld",tmpProduct.productPrice,tmpProduct.productCount];
    }
    
    return;
}
@end
