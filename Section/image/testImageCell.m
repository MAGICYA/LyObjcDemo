//
//  testImageCell.m
//  LyObjcDemo
//
//  Created by wly1 on 15/11/17.
//
//

#import "testImageCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface testImageCell ()

@property (nonatomic,strong) UIImageView *testImage ;
@end

@implementation testImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        _testImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        [self addSubview:_testImage];
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        l.text = @"1";
        [self addSubview:l];
    }
    return self;
}
- (void)setImageUrl:(NSString*)imgUrl
{
    [_testImage sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
