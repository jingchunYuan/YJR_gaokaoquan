//
//  MajorDetalController.m
//  gaokaoquan
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalController.h"
#import "DetalHeaderCell.h"
#import "ZhuanYeJieshaoCell.h"
#import "MajorDetalJieshaoModel.h"
#import "MajorDetalJieshaoModel+Request.h"
#import "MajorDetalKaisheGaoXiaoModel+Request.h"
#import "KaiSheGaoXiaoCell.h"
#import "MajorDetalXueYouPingLunModel.h"
#import "MajorDetalXueYouPingLunModel+Request.h"
#import "XueYouPingJiaCell.h"
#import "MajorDetalJiuYeQingKuangModel.h"
#import "MajorDetalJiuYeQingKuangModel+Request.h"
#import "JiuYeQingKuangCell.h"

@interface MajorDetalController ()<UITableViewDataSource,UITableViewDelegate,DetalHeaderCellDelegate,KaiSheGaoXiaoCellDelegate>
{
    int _isFlagTag;
}
@property (nonatomic, strong)  UITableView *tableView;
@property (strong, nonatomic)  NSMutableArray *dataArr;
@property (strong, nonatomic)  NSMutableArray *dataArr2;
@property (strong, nonatomic)  NSMutableArray *dataArr3;
@property (strong, nonatomic)  NSMutableArray *dataArr4;

@end

@implementation MajorDetalController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.name;
    //初始化数据
    _isFlagTag = 101;
    //加载数据
    [self loadData];
    //创建UI
    [self createUI];
    
}


#pragma mark - 
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isFlagTag==101) {
        return 2;
    }
    if (_isFlagTag==102) {
        return [_dataArr2 count]+1;
    }
    if (_isFlagTag==103) {
        return [_dataArr3 count]+1;
    }
    if (_isFlagTag==104) {
        return [_dataArr4 count]+1;
    }
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        static NSString *cellId = @"DetalHeaderCell";
        DetalHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        cell.backgroundColor = VIEWCONTROLLERBGCOLOR;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //设置代理
        cell.delegate = self;
        if (!cell) {
            cell = [[DetalHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        if ([self.dataArr count]) {
            MajorDetalJieshaoModel *model = self.dataArr[indexPath.row];
            cell.model = model;
        }

        return cell;
    }
    else {
        
        //专业介绍
        if (_isFlagTag==101) {
            static NSString *cellId = @"ZhuanYeJieshaoCell";
            ZhuanYeJieshaoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (!cell) {
                cell = [[ZhuanYeJieshaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            if ([self.dataArr count]) {
                MajorDetalJieshaoModel *model = [self.dataArr firstObject];
                cell.model = model;
            }
            return cell;
        }
        
        //开设高校
        if (_isFlagTag==102) {
            static NSString *cellId = @"KaiSheGaoXiaoCell";
            KaiSheGaoXiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            cell.delegate = self;
            NSLog(@"开设高校 cell.tag = %ld", indexPath.row-1);
            cell.tag = 200 + (indexPath.row-1);
            
            if (!cell) {
                cell = [[KaiSheGaoXiaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            if ([self.dataArr2 count]) {
                MajorDetalKaisheGaoXiaoModel *model = self.dataArr2[indexPath.row-1];
                cell.model = model;
            }
            return cell;
        }
        
        //学友评论
        if (_isFlagTag==103) {
            static NSString *cellId = @"XueYouPingJiaCell";
            XueYouPingJiaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            if (!cell) {
                cell = [[XueYouPingJiaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            if ([self.dataArr3 count]) {
                MajorDetalXueYouPingLunModel *model = self.dataArr3[indexPath.row-1];
                cell.model = model;
            }
            return cell;
        }
        
        //就业情况
        if (_isFlagTag==104) {
            static NSString *cellId = @"JiuYeQingKuangCell";
            JiuYeQingKuangCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            if (!cell) {
                cell = [[JiuYeQingKuangCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            if ([self.dataArr4 count]) {
                MajorDetalJiuYeQingKuangModel *model = [self.dataArr4 firstObject];
                cell.model = model;
            }
            return cell;
        }
        
        return nil;
        
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 235;
    }
    else {
        if (_isFlagTag==101) {
            MajorDetalJieshaoModel *model = [self.dataArr firstObject];
            NSString *htmlString = model.content;
            //高度
            NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:13.0]};
            CGRect rect = [htmlString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                attributes:attrs
                                                   context:nil];
            return rect.size.height + 20;
        }
        if (_isFlagTag==102) {
            return 100;
        }
        if (_isFlagTag==103) {
            return 100;
        }
        if (_isFlagTag==104) {
            MajorDetalJiuYeQingKuangModel *model = [self.dataArr4 firstObject];
            NSString *htmlString = model.comment;
            //高度
            NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:13.0]};
            CGRect rect = [htmlString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                attributes:attrs
                                                   context:nil];
            return rect.size.height + 20;
        }
        
        return 100;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //开设高校
    if (_isFlagTag==102) {
        NSLog(@"Select row = %ld",indexPath.row);
        //点击学校进入学校详情页
        MajorDetalKaisheGaoXiaoModel *model = self.dataArr2[indexPath.row-1];
        
        
    }
    
}

#pragma mark - 
#pragma mark - DetalHeaderCellDelegate
- (void)btnClickAction:(DetalHeaderCell *)detalHeaderCell withBtnTag:(int)tag {
    NSLog(@"DetalHeaderCell tag = %d", tag);
    
    //开设高校
    NSString *url1 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/major/college?id=%@",@"2"];
    //学友评论
    NSString *url2 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/major/comment?id=%@",@"2"];
    //就业情况
    NSString *url3 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/major/across?id=%@",@"2"];

    _isFlagTag = tag;
    switch (tag) {
            
        case 101:
            //专业介绍
            [self loadData];
            //更改UI
            detalHeaderCell.lineView1.alpha = 1.0;
            detalHeaderCell.lineView2.alpha = 0.0;
            detalHeaderCell.lineView3.alpha = 0.0;
            detalHeaderCell.lineView4.alpha = 0.0;
            break;
            
        case 102:
            //开设高校
            [self loadData:url1 withTag:tag];
            //更改UI
            detalHeaderCell.lineView1.alpha = 0.0;
            detalHeaderCell.lineView2.alpha = 1.0;
            detalHeaderCell.lineView3.alpha = 0.0;
            detalHeaderCell.lineView4.alpha = 0.0;
            break;
            
        case 103:
            //学友评论
            [self loadData:url2 withTag:tag];
            //更改UI
            detalHeaderCell.lineView1.alpha = 0.0;
            detalHeaderCell.lineView2.alpha = 0.0;
            detalHeaderCell.lineView3.alpha = 1.0;
            detalHeaderCell.lineView4.alpha = 0.0;
            break;
            
        case 104:
            //就业情况
            [self loadData:url3 withTag:tag];
            //更改UI
            detalHeaderCell.lineView1.alpha = 0.0;
            detalHeaderCell.lineView2.alpha = 0.0;
            detalHeaderCell.lineView3.alpha = 0.0;
            detalHeaderCell.lineView4.alpha = 1.0;
            break;
            
        default:
            break;
    }
    
}


- (void)loadData {
    NSString * url = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/major/view?id=%@",@"2"];
    __weak typeof(self) weakSelf = self;
     
    [MajorDetalJieshaoModel RequestWithUrl:url
                                   andPara:nil
                               andCallBack:^(id dict, NSError *err) {
        if(!err){
            NSLog(@"专业查询 dict = %@", dict);
            MajorDetalJieshaoModel *model = dict;
            //先清除，再添加数据
            [weakSelf.dataArr removeAllObjects];
            [weakSelf.dataArr addObject:model];
            [weakSelf.tableView reloadData];
        }
        
    }];
}

- (void)loadData:(NSString *)url withTag:(int)tag {
    
    //开设高校
    if (tag == 102) {

        __weak typeof(self) weakSelf = self;
        [MajorDetalKaisheGaoXiaoModel RequestWithUrl:url andPara:nil andCallBack:^(NSArray *arr, NSError *err) {
            if (!err) {
                NSLog(@"开设高校 arr = %@",arr);
                [weakSelf.dataArr2 removeAllObjects];
                [weakSelf.dataArr2 addObjectsFromArray:arr];
                [weakSelf.tableView reloadData];
            }
        }];
    }
    
    //学友评论
    if (tag == 103) {
        
        __weak typeof(self) weakSelf = self;
        [MajorDetalXueYouPingLunModel RequestWithUrl:url andPara:nil andCallBack:^(NSArray *arr, NSError *err) {
            if (!err) {
                NSLog(@"学友评论 arr = %@",arr);
                [weakSelf.dataArr3 removeAllObjects];
                [weakSelf.dataArr3 addObjectsFromArray:arr];
                [weakSelf.tableView reloadData];
            }
        }];
        
    }
    
    //就业情况
    if (tag == 104) {
        
        __weak typeof(self) weakSelf = self;
        [MajorDetalJiuYeQingKuangModel RequestWithUrl:url andPara:nil andCallBack:^(id dict, NSError *err) {
            if (!err) {
                NSLog(@"就业情况 dict = %@", dict);
                MajorDetalJiuYeQingKuangModel *model = dict;
                //先清除，再添加数据
                [weakSelf.dataArr4 removeAllObjects];
                [weakSelf.dataArr4 addObject:model];
                [weakSelf.tableView reloadData];
            }
        }];
        
    }
    
}

- (void)createUI {
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    [self.view addSubview:self.tableView];

}

-(void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark - KaiSheGaoXiaoCellDelegate
- (void)guanzhuBtnClick:(KaiSheGaoXiaoCell *)kaiSheGaoXiaoCell {
    NSLog(@"开设高校的关注按钮  tag = %ld",kaiSheGaoXiaoCell.tag);
    
    
}

#pragma mark - 
#pragma mark - Getter and Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = VIEWCONTROLLERBGCOLOR;
        
        //注册
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DetalHeaderCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DetalHeaderCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZhuanYeJieshaoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZhuanYeJieshaoCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KaiSheGaoXiaoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([KaiSheGaoXiaoCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XueYouPingJiaCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([XueYouPingJiaCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JiuYeQingKuangCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JiuYeQingKuangCell class])];
        
    }
    return _tableView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

-(NSMutableArray *)dataArr2{
    if (!_dataArr2) {
        _dataArr2 = [[NSMutableArray alloc]init];
    }
    return _dataArr2;
}

-(NSMutableArray *)dataArr3{
    if (!_dataArr3) {
        _dataArr3 = [[NSMutableArray alloc]init];
    }
    return _dataArr3;
}

-(NSMutableArray *)dataArr4{
    if (!_dataArr4) {
        _dataArr4 = [[NSMutableArray alloc]init];
    }
    return _dataArr4;
}

@end
