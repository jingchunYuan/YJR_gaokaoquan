//
//  JYMyIndentView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMyIndentView.h"

@interface JYMyIndentView ()
@property (weak, nonatomic) IBOutlet UILabel *indentlabel;

@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UILabel *PayLabel;
@end

@implementation JYMyIndentView

- (IBAction)IndentDetails:(UIButton *)sender {
  
    
    self.block();
    
    
  
}

- (void)indentDteail:(MyindentDteail)block
{
    self.block = block;


}

- (void)setModel:(JYMYIndentModel *)Model
{

    _Model = Model;
    
    
    self.indentlabel.text = [NSString stringWithFormat:@"【服务】%@",Model.title];
    
    self.price.text = Model.price;
    
    self.PayLabel.text = Model.status_title;
    


}


@end
