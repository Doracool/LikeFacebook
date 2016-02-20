//
//  QYTabBar.h
//  CopyWeibo
//
//  Created by qingyun on 16/2/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYTabBar;
#warning 因为tabBar继承UItabBar
@protocol QYTabbarDelegate <UITabBarDelegate>
@optional
-(void)tabBarDidClickPlusButton:(QYTabBar *)tabBar;
@end

@interface QYTabBar : UITabBar
@property (nonatomic, weak) id<QYTabbarDelegate> delegate;
@end
