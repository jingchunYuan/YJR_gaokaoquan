//
//  WishCell.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/20.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WishBtnModel.h"
@interface WishCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *serviceIcon;
@property (weak, nonatomic) IBOutlet UILabel *serviceName;

@property (nonatomic,strong)WishBtnModel * model;
@end
