//
//  QYHomeViewController.m
//  CopyWeibo
//
//  Created by qingyun on 16/1/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabbarVIewController.h"
#import "QYHomeViewController.h"
#import "QYMessageViewController.h"
#import "QYMoerViewController.h"
#import "QYFindViewController.h"
#import "QYSettingViewController.h"
#import "Common.h"
#import "QYNavcontroller.h"
#import "QYTabBar.h"
@interface QYTabbarVIewController ()<QYTabbarDelegate>

@end

@implementation QYTabbarVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QYHomeViewController *home = [[QYHomeViewController alloc] init];
    [self addChildVC:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    QYMessageViewController *message = [[QYMessageViewController alloc] init];
    [self addChildVC:message title:@"信息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    //添加button按钮
//    self.tabBar = [[QYTabBar alloc] init];与下边的效果相同
    QYTabBar *tabBar = [[QYTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    //[self setValue:tabBar forKeyPath:@"tabBar"]; 这段代码执行完之后 tabbar 的delegate 就是QYTabBarViewController
    //说明不需要设置delegate
    
    
    //如果tabbar设置完delegate后在执行下面修改delegate就会报错
    
    //如果再次修改Tabbar的delegate属性就会报错
    
    
    QYFindViewController *find = [[QYFindViewController alloc] init];
    [self addChildVC:find title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    QYSettingViewController *setting = [[QYSettingViewController alloc] init];
    [self addChildVC:setting title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}


/**
 *  添加一个自控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中图片
 */

//3 设置子视图控制器
//代码抽取 重构
// 相同的放到一个方法中
// 不同的东西变成参数
// 在使用这段代码的这个地方调用方法  传递参数
-(void)addChildVC:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //这句话 可以设置tabbar和navbar 的文字
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 声明 这张图片显示出来是原始的样子 不用自动渲染成其他颜色
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置文字样式
    NSMutableDictionary *SelectedtextAttrs = [NSMutableDictionary dictionary];
    SelectedtextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:SelectedtextAttrs forState:UIControlStateSelected];
//    childVc.view.backgroundColor = QYRandomColor;
    QYNavcontroller *nav = [[QYNavcontroller alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}


#pragma mark - QYTabBarDelegate代理方法

-(void)tabBarDidClickPlusButton:(QYTabBar *)tabBar
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = QYRandomColor;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
