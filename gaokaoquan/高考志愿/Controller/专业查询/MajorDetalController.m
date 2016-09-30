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

@interface MajorDetalController ()<UITableViewDataSource,UITableViewDelegate,DetalHeaderCellDelegate>

@property (nonatomic, strong)  UITableView *tableView;
@property (strong, nonatomic)  NSMutableArray *dataArr;

@end

@implementation MajorDetalController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.name;
    //加载数据
    [self loadData];
    //创建UI
    [self createUI];
    
    
}


#pragma mark - 
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 235;
    }
    else {
        
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
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
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

    switch (tag) {
        case 101:
            //专业介绍
            [self loadData];
            break;
            
        case 102:
            //开设高校
            [self loadData:url1 withTag:tag];
            break;
            
        case 103:
            //学友评论
            [self loadData:url2 withTag:tag];
            break;
            
        case 104:
            //就业情况
            [self loadData:url3 withTag:tag];
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
        
    }
    
    //学友评论
    if (tag == 103) {
        
    }
    
    //就业情况
    if (tag == 104) {
        
    }
    
}

- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
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
#pragma mark - Getter and Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = VIEWCONTROLLERBGCOLOR;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DetalHeaderCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DetalHeaderCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZhuanYeJieshaoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZhuanYeJieshaoCell class])];

    }
    return _tableView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

@end
