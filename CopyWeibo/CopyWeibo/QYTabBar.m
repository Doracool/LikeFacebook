//
//  QYTabBar.m
//  CopyWeibo
//
//  Created by qingyun on 16/2/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabBar.h"
#import "UIView+Extension.h"

@interface QYTabBar ()
@property (nonatomic, weak) UIButton *plusBtn;

@end
@implementation QYTabBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加一个按钮到tabbar中
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}
-(void)plusClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

- (void)layoutSubviews
{
#warning [super layoutSubViews] 一定不能删除
    [super layoutSubviews];
    
    //1 设置加号按钮的位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    //设置其他按钮的位置
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    int count = self.subviews.count;
    for (int i = 0 ; i < count ; i ++) {
        UIView *child = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            //设置宽度
            child.width = tabbarButtonW;
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}
@end
