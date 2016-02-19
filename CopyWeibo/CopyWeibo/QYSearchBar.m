//
//  QYSearchBar.m
//  CopyWeibo
//
//  Created by qingyun on 16/2/18.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYSearchBar.h"
#import "UIView+Extension.h"
@implementation QYSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:14];
        self.placeholder = @"输入你想要搜索的内容";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;

    }
    return self;
}

+(instancetype)searchBar
{
    return [[self alloc] init];
}
@end
