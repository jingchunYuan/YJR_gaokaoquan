//
//  JiuYeQingKuangCell.m
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JiuYeQingKuangCell.h"

@implementation JiuYeQingKuangCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _jiuYeLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MajorDetalJiuYeQingKuangModel *)model {
    _model = model;
    
    //赋值
    NSString *htmlString = model.comment;
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    //高度
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:13.0]};
    CGRect rect = [htmlString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attrs
                                           context:nil];
    self.jiuYeLabel.frame = CGRectMake(10, 10, SCREEN_WIDTH-20, rect.size.height);
    self.jiuYeLabel.attributedText = attStr;
    
}

@end
