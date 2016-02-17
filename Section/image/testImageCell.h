//
//  testImageCell.h
//  LyObjcDemo
//
//  Created by wly1 on 15/11/17.
//
//

#import <UIKit/UIKit.h>

@interface testImageCell : UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setImageUrl:(NSString*)imgUrl;
@end
