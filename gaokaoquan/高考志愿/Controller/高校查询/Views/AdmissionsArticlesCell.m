//
//  AdmissionsArticlesCell.m
//  gaokaoquan
//
//  Created by admin on 2016/10/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AdmissionsArticlesCell.h"

@interface AdmissionsArticlesCell ()

@end

@implementation AdmissionsArticlesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.zhaoShengLabel.numberOfLines = 0;
    self.showMoreBtn.centerX = (SCREEN_WIDTH-self.showMoreBtn.zj_width)/2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(GeneralModel *)model {
    _model = model;
    
    //赋值
    self.zhaoShengLabel.text = model.content;
    
    NSString *htmlString = model.content;
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    //高度
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12.0]};
    CGRect rect = [htmlString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attrs
                                           context:nil];
    if (_isFlagAdmissionsShow == 0) {
        self.zhaoShengLabel.frame = CGRectMake(10, 40, SCREEN_WIDTH-20, 120);
    }else {
        self.zhaoShengLabel.frame = CGRectMake(10, 40, SCREEN_WIDTH-20, rect.size.height);
    }
    self.zhaoShengLabel.attributedText = attStr;
    
}

- (IBAction)admissionsBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(admissionsArticlesBtnMethod:)]) {
        [self.delegate admissionsArticlesBtnMethod:self];
    }
}

@end
