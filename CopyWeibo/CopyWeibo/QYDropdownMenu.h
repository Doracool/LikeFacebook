//
//  QYDropdownMenu.h
//  CopyWeibo
//
//  Created by qingyun on 16/2/18.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYDropdownMenu : UIView

+(instancetype)menu;

-(void)showFrom:(UIView *)form;

-(void)dismiss;

@property (nonatomic, strong) UIView *content;
@property (nonatomic, strong) UIViewController *contentControler;

@end
