//
//  MajorDetalKaisheGaoXiaoModel.h
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MajorDetalKaisheGaoXiaoModel : NSObject
/*
{
    "id": "10",
    "tag": [
            "985",
            "211",
            "自主招生",
            "研究生院",
            "国防生"
            ],
    "name": "中山大学",
    "province": "广东",
    "type": "综合类",
    "logo": "http://img.gaokaoq.com/college/13Z011543540-163552.jpg"
},
*/
@property(nonatomic, copy) NSString *Id;
@property(nonatomic, copy) NSMutableArray *tagArray;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *province;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *logo;

@end
