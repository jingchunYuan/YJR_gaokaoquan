//
//  JYTutorCenterTableViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/5.
//  Copyright © 2016年 袁静茹. All rights reserved.
// #import <MobileCoreServices/MobileCoreServices.h>

#import "JYTutorCenterTableViewController.h"
#import "JYTutorCenterView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "JYTutorinformModel.h"
#import "JYTutorInformTableViewController.h"
#import "JYTutorMyExpViewController.h"
#import "JYTutorMyGoldViewController.h"
#import "JYTutorAppointViewController.h"
#import "JYTutorLnviteViewController.h"
#import "JYTutorAnswerViewController.h"
#import "JYSettingViewController.h"
#import "JYTutorMyMessageViewController.h"
#import "JYMYFollowViewController.h"
@interface JYTutorCenterTableViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation JYTutorCenterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.titleView = [self.view titleWithNavigat:@"导师中心"];
    
    JYTutorCenterView *view = [[JYTutorCenterView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 200)];
    
    __weak typeof(self)WeakSelf = self;
    
    self.tableView.tableHeaderView = view;
    
    
    [view myMessageClick:^{
       
        JYTutorMyMessageViewController *message = [[JYTutorMyMessageViewController alloc]init];
        
        [WeakSelf.navigationController pushViewController:message animated:YES];
        
    }];
    
    
    [view ExpClick:^{
       
        JYTutorMyExpViewController *tutor = [[JYTutorMyExpViewController alloc]init];
        
        [WeakSelf.navigationController pushViewController:tutor animated:YES];
        
        
    }];
    
    
    
    [view GoldClick:^{
       
        
        JYTutorMyGoldViewController *gold = [[JYTutorMyGoldViewController alloc]init];
        
        [WeakSelf.navigationController pushViewController:gold animated:YES];
        
        
    }];
    
    
    // 按钮回调点击事件
    [view iconBtnClick:^{
        
#warning 设置头像
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
            
            [WeakSelf presentViewController:picker animated:YES completion:nil];
        
            
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"从照片中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            //调用系统相册的类
            UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
            
            //设置选取的照片是否可编辑
            pickerController.allowsEditing = YES;

            pickerController.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;//图片分组列表样式
            
            pickerController.delegate = self;

            [WeakSelf presentViewController:pickerController animated:YES completion:^{
                
            }];
            
            
        }]];
        
            [WeakSelf presentViewController:alert animated:YES completion:nil];
        
        
    }];
    
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/AdvisorCenter/index" parameters:nil callback:^(id responseObject, NSError *error) {
       
        
        JYTutorinformModel *TutorModel = [JYTutorinformModel mj_objectWithKeyValues:responseObject[@"data"][@"advisor"]];
        
        
         view.model = TutorModel;
        
        
    }];
    
    
    
    

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 系统相册调用的方法

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
     NSLog(@"%@",info);
    
    
    
    //刚才已经看了info中的键值对，可以从info中取出一个UIImage对象，将取出的对象赋给按钮的image
    
    UIButton *button = (UIButton *)[self.view viewWithTag:24];
    
    UIImage *resultImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    [button setImage:[resultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];//如果按钮创建时用的是系统风格UIButtonTypeSystem，需要在设置图片一栏设置渲染模式为"使用原图"

    
    //使用模态返回到软件界面
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            JYTutorInformTableViewController *inform = [[JYTutorInformTableViewController alloc]init];
            
            [self.navigationController pushViewController:inform animated:YES];
            
        }
        
        
    }else if (indexPath.section == 1){
       
        if (indexPath.row == 0) {
            
            JYTutorAppointViewController *appoint = [[JYTutorAppointViewController alloc]init];
            
            [self.navigationController pushViewController:appoint animated:YES];
            
            
        }else if (indexPath.row == 1){
    
            // 我的回答
            JYTutorAnswerViewController *tutorAnswer = [[JYTutorAnswerViewController alloc]init];
            
            
            [self.navigationController pushViewController:tutorAnswer animated:YES];
            
        
        
        }else if (indexPath.row == 2){
        
         NSLog(@"4");
        }
    
    
    }else if (indexPath.section ==2){
    
        JYMYFollowViewController *follew = [[JYMYFollowViewController alloc]init];
        
        [self.navigationController pushViewController:follew animated:YES];
     
        
    
    }else if (indexPath.section == 3){
    
   
        JYTutorLnviteViewController *tutorLnvite = [[JYTutorLnviteViewController alloc]init];
        
        [self.navigationController pushViewController:tutorLnvite animated:YES];
        
        
    
    }else if (indexPath.section == 4){
       
       
        JYSettingViewController *setting = [[JYSettingViewController alloc]init];
        
        [self.navigationController pushViewController:setting animated:YES];
        

    }


}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 15;
}



@end
