//
//  StudentCenterTableViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/2.
//  Copyright © 2016年 袁静茹. All rights reserved.
#import "JYStudentCenterTableViewController.h"
#import "StudentCenterView.h"
#import "JYStudentSettingModel2.h"
#import "JYStudentSettingModel.h"
#import "JYMyMessageTableViewController.h"
#import "JYMYCouponViewController.h"
#import "JYServiceCenterViewController.h"
#import "JYInformationViewController.h"
#import "JYAnswerViewController.h"
#import "JYMyPersonalViewController.h"
#import "JYIndentViewController.h"
#import "JYLectureViewController.h"
#import "JYAppointmentViewController.h"
#import "JYLnviteViewController.h"
#import "JYMyExperienceController.h"
#import "MJExtension.h"
#import "JYStudentInformModel.h"
#import "JYCreatTimeModel.h"
#import "UIImageView+WebCache.h"
#import "JYMyGoldControllerViewController.h"
#import "JYMYFollowViewController.h"
#import "JYstudentSettingViewController.h"
@interface StudentCenterTableViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
// 图片的名称
@property(nonatomic,strong)NSMutableArray *DataArray;
//// 文字
@property(nonatomic,strong)UIImageView *iconImage;

@end
@implementation StudentCenterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = NO;
    
    UITableView *Tableview = [[UITableView alloc]initWithFrame:self.view.bounds  style:UITableViewStyleGrouped];
    
    // 设置tableview的内边距
    Tableview.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    
    [self.view addSubview:Tableview];
#warning 在这里进行xib按钮点击回调吗?
    StudentCenterView *student = [[StudentCenterView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 200)];
   
    // 发送请求获得数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/index" parameters:nil callback:^(id responseObject, NSError *error) {
        
        JYStudentInformModel *inform = [JYStudentInformModel mj_objectWithKeyValues:responseObject[@"data"][@"advisor"]];
        
        // 设置学生信息
        student.ID.text = inform.ID;
        student.name.text = inform.true_name;
        student.balance.text = inform.balance;
        
        NSURL *url = [NSURL URLWithString:inform.avatar];
        
        [student.iconImage sd_setImageWithURL:url placeholderImage:nil];
        
    }];
    
    // 给图片增加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick)];
    
    [student.iconImage addGestureRecognizer:tap];
    
    self.iconImage = student.iconImage;
    
    // view按钮的回调
    __weak typeof(self)WeakSelf = self;
    // 我的消息按钮
    [student MyMessageCilick:^{
       
        JYMyMessageTableViewController *VC = [[JYMyMessageTableViewController alloc]init];
        
        [WeakSelf.navigationController pushViewController:VC animated:YES];
        
    }];
    
    // 我的经验按钮
    [student MyExperienceClick:^{
       
        JYMyExperienceController *experience = [[JYMyExperienceController alloc]init];
        
        [self.navigationController pushViewController:experience animated:YES];
        
        
    }];
    
    // 我的金币按钮
    [student MyGoldClick:^{
       
        JYMyGoldControllerViewController *gold = [[JYMyGoldControllerViewController alloc]init];
        
        [self.navigationController pushViewController:gold animated:YES];
        
        
    }];
    
    // 我的优惠券按钮
    [student MyCouponClick:^{
       
        JYMYCouponViewController *Coupon = [[JYMYCouponViewController alloc]init];
        
        [WeakSelf.navigationController pushViewController:Coupon animated:YES];
        
        
    }];
    
    [Tableview setTableHeaderView:student];
    
    Tableview.dataSource = self;
    Tableview.delegate = self;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"个人中心-右上角设置.png" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"学员中心"];
    
    // 取消分割线
   Tableview.separatorStyle = UITableViewCellSeparatorStyleNone;

    
}

// MARK:-图片的手势操作
-(void)TapClick
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择图像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        
        picker.allowsEditing = YES;
        
        picker.sourceType = sourceType;
        
        [self presentViewController:picker animated:YES completion:nil];
        
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"从照片中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        //调用系统相册的类
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        
        //设置选取的照片是否可编辑
        pickerController.allowsEditing = YES;
        
        pickerController.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;//图片分组列表样式
        
        
        pickerController.delegate = self;
        
        [self presentViewController:pickerController animated:YES completion:^{
            
        }];
        
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];

  
}

// MARK:-打开相机或相册调用的代理方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 系统相册调用的方法

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSLog(@"%@",info);
    //刚才已经看了info中的键值对，可以从info中取出一个UIImage对象，将取出的对象赋给按钮的image
    
    UIImage *resultImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    self.iconImage.image = resultImage;
    
    //如果按钮创建时用的是系统风格UIButtonTypeSystem，需要在设置图片一栏设置渲染模式为"使用原图"
    
    
    //使用模态返回到软件界面
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



// MARK:-设置按钮
-(void)rightBarButtonItemClick
{
  
    JYstudentSettingViewController *setting = [[JYstudentSettingViewController alloc]init];
    
    [self.navigationController pushViewController:setting animated:YES];


}

-(void)leftBarButtonItemClick
{
    self.tabBarController.selectedIndex = 0;
    
}
// MARK:-数据源 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    
    return self.DataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    JYStudentSettingModel2 *model = self.DataArray[section];
  
    return model.imageName.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 先去外层数据
    JYStudentSettingModel2 *OutModel = self.DataArray[indexPath.section];
    
    // 再取里层数据
    JYStudentSettingModel *InModel = OutModel.imageName[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:InModel.icon];
    cell.textLabel.text = InModel.name;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = [UIColor grayColor];
    
    
    return cell;
}

#warning 点击不同的cell显示不同的界面,跳转的是相同控制器
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            JYServiceCenterViewController *service = [[JYServiceCenterViewController alloc]init];
            
            [self.navigationController pushViewController:service animated:YES];
            
            
        }else if (indexPath.row == 1){
            
            
            JYInformationViewController *inform = [[JYInformationViewController alloc]init];
            
            [self.navigationController pushViewController:inform animated:YES];
            
        }else if (indexPath.row == 2){
        
            JYAnswerViewController *answer = [[JYAnswerViewController alloc]init];
            
            [self.navigationController pushViewController:answer animated:YES];
        
        }
        
    }else if (indexPath.section == 1){
    
        if (indexPath.row == 0) {
            
            JYMyPersonalViewController *personal = [[JYMyPersonalViewController alloc]init];
            
            [self.navigationController pushViewController:personal animated:YES];
            
        }else if (indexPath.row == 1){
        
            
            JYMYFollowViewController *follow = [[JYMYFollowViewController alloc]init];
            
            [self.navigationController pushViewController:follow animated:YES];
            
        }else if (indexPath.row == 2){
        
            JYIndentViewController *indent = [[JYIndentViewController alloc]init];
            
            [self.navigationController pushViewController:indent animated:YES];
           
        }
    
    
    }else if (indexPath.section == 2){
    
        if (indexPath.row == 0) {
            
            JYLectureViewController *lecture = [[JYLectureViewController alloc]init];

            [self.navigationController pushViewController:lecture animated:YES];
            
        }else if (indexPath.row == 1){
        
        
            JYAppointmentViewController *appointment = [[JYAppointmentViewController alloc]init];
            
            [self.navigationController pushViewController:appointment animated:YES];
        
        }else if (indexPath.row == 2){
        
           JYLnviteViewController *lnvite = [[JYLnviteViewController alloc]init];
            
            [self.navigationController pushViewController:lnvite animated:YES];
        
        
        }
      
    }else if (indexPath.section == 3){
        
        if (indexPath.row == 0) {
            
            NSURL *url = [NSURL URLWithString:@"tel://010-82539927"];
            
            [[UIApplication sharedApplication]openURL:url];
            
        }
        
    }
    
    // pop回来时取消选中cell
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
}

// MARK:-懒加载界面的数据
-(NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"personal.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            
            JYStudentSettingModel2 *model = [JYStudentSettingModel2 StudentSettingModelWithDict:dict];
            
            [tempArray addObject:model];
            
        }
        _DataArray = tempArray;
    }
    return _DataArray;
}

// MARK:-设置section的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
@end
