//
//  Common.h
//  CopyWeibo
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#ifndef Common_h
#define Common_h


//RGB颜色
#define QYColor(r, g, b) [UIColor colorWithRed:arc4random_uniform(r)/255.0 green:arc4random_uniform(g)/255.0 blue:arc4random_uniform(b)/255.0 alpha:1.0]

// 随机色
#define QYRandomColor QYColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))


#ifdef DEBUG //
#define QYLog(...) NSLog(__VA_ARGS__)
#else //
#define QYLog(...)
#endif

#endif /* Common_h */
