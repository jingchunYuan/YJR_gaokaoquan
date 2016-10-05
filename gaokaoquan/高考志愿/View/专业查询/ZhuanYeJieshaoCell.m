//
//  ZhuanYeJieshaoCell.m
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ZhuanYeJieshaoCell.h"

@implementation ZhuanYeJieshaoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.jieShaoLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MajorDetalJieshaoModel *)model {
    _model = model;
    //赋值
    NSString *htmlString = model.content;
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    //高度
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:13.0]};
    CGRect rect = [htmlString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                               attributes:attrs
                                  context:nil];
    self.jieShaoLabel.frame = CGRectMake(10, 10, SCREEN_WIDTH-20, rect.size.height);
    self.jieShaoLabel.attributedText = attStr;

}

@end
