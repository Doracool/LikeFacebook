//
//  QYItemTool.h
//  CopyWeibo
//
//  Created by qingyun on 16/2/17.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>
@interface QYItemTool : NSObject
+(UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action Image:(NSString *)image HighImage:(NSString *)highImage;
@end
