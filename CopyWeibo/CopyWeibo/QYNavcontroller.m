//
//  QYNavcontroller.m
//  CopyWeibo
//
//  Created by qingyun on 16/1/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYNavcontroller.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"
@interface QYNavcontroller ()

@end

@implementation QYNavcontroller

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

+ (void)initialize
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置普通
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];

    //设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
   
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //设置尺寸
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(back) Image:@"navigationbar_back" HighImage:@"navigationbar_back_highlighted"];

        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(more) Image:@"navigationbar_more" HighImage:@"navigationbar_more_highlighted"];
        
        
    }
     [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

-(void)more{
    [self popToRootViewControllerAnimated:YES];
}
@end
