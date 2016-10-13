//
//  SchoolGaiKuangCell.m
//  gaokaoquan
//
//  Created by admin on 2016/10/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "SchoolGaiKuangCell.h"

@interface SchoolGaiKuangCell ()

@property (weak, nonatomic) IBOutlet UILabel *xuexiaokaikuangLabel;

@end

@implementation SchoolGaiKuangCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(GeneralModel *)model {
    _model = model;
    
    //赋值
    self.contentLabel.text = model.content;
    
    NSString *htmlString = model.content;
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    //高度
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12.0]};
    CGRect rect = [htmlString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:attrs
                                           context:nil];
    if (_isFlagShoolShow == 0) {
        self.contentLabel.frame = CGRectMake(10, 40, SCREEN_WIDTH-20, 120);
    }else {
        self.contentLabel.frame = CGRectMake(10, 40, SCREEN_WIDTH-20, rect.size.height);
    }
    self.contentLabel.attributedText = attStr;
    
}

- (IBAction)schoolBtnClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(schoolGaiKuangBtnMethod:)]) {
        [self.delegate schoolGaiKuangBtnMethod:self];
    }
    
}

@end
