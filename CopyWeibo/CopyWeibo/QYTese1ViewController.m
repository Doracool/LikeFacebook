//
//  QYTese1ViewController.m
//  CopyWeibo
//
//  Created by qingyun on 16/1/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTese1ViewController.h"
#import "QYTest2ViewController.h"
@interface QYTese1ViewController ()

@end

@implementation QYTese1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    QYTest2ViewController *test2 = [[QYTest2ViewController alloc] init];
    test2.title = @"测试控制器2";
    [self.navigationController pushViewController:test2 animated:YES];
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
