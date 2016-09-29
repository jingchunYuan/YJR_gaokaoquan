//
//  JYMBTIModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
/*
 
 id: "2",
 test_name: "MBTI职业性格测试",
 test_num: "37263",
 content: {
 title: "MBTI（迈尔斯-布里格斯类型指标）性格测试是由美国的心理学家Katherine Cook Briggs (1875-1968) 和她的心理学家女儿Isabel Briggs Myers根据瑞士著名的心理分析学家Carl G. Jung (荣格)的心理类型理论和她们对于人类性格差异的长期观察和研究而著成。这个指标以瑞士心理学家荣格划分的8种类型为基础，加以扩展，形成四个维度，即",
 titles: "<p>四个维度如同四把标尺，每个人的性格都会落在标尺的某个点上，这个点靠近哪个端点，就意味着个体有哪方面的偏好。如在第一维度上，个体的性格靠近外倾这一端，就偏外倾，而且越接近端点，偏好越强。</p>",
 test: "<h3>测试须知</h3> <p>1.请务必诚实、独立地回答问题,凭借第一反应才能得到科学、准确的结果。 <p>2.MBTI提供的性格类型描述仅供测试者确定自己的性格类型之用,性格类型没有好坏,只有不同每一种类型均有其优缺点。加强对自我职业性格的认识，有助于更好地发挥自己的特长，在为人处事的过程中扬长避短，更好地与他人相处，同时为个人职业发展决策提供参考。</p> <p>3.只要你是认真、真实地填写了问卷，那么通常情况下你都能得到一个确实和你的性格相匹配的类型。希望你能从中或多或少地获得一些有益的信息。</p>"
 }
 */

#import <Foundation/Foundation.h>
@class JYMBTIModel2;

@interface JYMBTIModel : NSObject

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *test_name;

@property (nonatomic,copy) NSString *test_num;

@property (nonatomic,strong) JYMBTIModel2 *content;

@end
