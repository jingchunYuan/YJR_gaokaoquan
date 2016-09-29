//
//  DongtaiModel.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/5.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface DongtaiModel : JSONModel

@property (nonatomic,copy)NSString * type;
@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * ask_id;
@property (nonatomic,strong)NSString * comment_id;


@end
