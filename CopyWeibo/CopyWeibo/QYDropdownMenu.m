//
//  QYDropdownMenu.m
//  CopyWeibo
//
//  Created by qingyun on 16/2/18.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYDropdownMenu.h"
#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
@interface QYDropdownMenu ()
/**
 *  将来用来显示具体的容器
 */
@property (nonatomic, weak) UIImageView *containerView;
@end
@implementation QYDropdownMenu

- (UIImageView *)containerView
{
    if (!_containerView) {
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.width = 217;
        containerView.height = 217;
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //清除颜色
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

-(void)setContent:(UIView *)content
{
    _content = content;
    //调整内容的位置
    content.x = 10;
    content.y = 15;
    
    //调整内容的宽度
//    content.width = self.containerView.width - 2 * content.x;
    
    //设置灰色的尺寸
    self.containerView.height = CGRectGetMaxY(content.frame) + 10;
    
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    //添加内容到灰色图片中
    [self.containerView addSubview:content];
}

-(void)setContentControler:(UIViewController *)contentControler
{
    _contentControler = contentControler;
    
    self.content = contentControler.view;
}
+ (instancetype)menu
{
    return [[self alloc] init];
}
-(void)showFrom:(UIView *)form
{
    //获得最上边的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    //添加自己到窗口上
    [window addSubview:self];
    
    //设置尺寸
    self.frame = window.bounds;
    
    //调整图片位置
    // 默认情况下，frame是以父控件左上角为坐标原点
    // 转换坐标系
    CGRect newFrame = [form convertRect:form.bounds toView:window];
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y = CGRectGetMidY(newFrame) + 10;
    
    //通知外界自己显示了
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDisShow:)]) {
        [self.delegate dropdownMenuDisShow:self];
    }
}

-(void)dismiss
{
    [self removeFromSuperview];
    
    //通知外界自己被销毁了
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDismiss:)]) {
        [self.delegate dropdownMenuDismiss:self];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}
@end
