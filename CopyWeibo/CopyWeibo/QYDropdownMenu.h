//
//  QYDropdownMenu.h
//  CopyWeibo
//
//  Created by qingyun on 16/2/18.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYDropdownMenu;
@protocol QYDropdownMenuDelegate <NSObject>
@optional
-(void)dropdownMenuDismiss:(QYDropdownMenu *)menu;
-(void)dropdownMenuDisShow:(QYDropdownMenu *)menu;

@end
@interface QYDropdownMenu : UIView

@property (nonatomic , weak) id<QYDropdownMenuDelegate> delegate;
+(instancetype)menu;

-(void)showFrom:(UIView *)form;

-(void)dismiss;

@property (nonatomic, strong) UIView *content;
@property (nonatomic, strong) UIViewController *contentControler;

@end
