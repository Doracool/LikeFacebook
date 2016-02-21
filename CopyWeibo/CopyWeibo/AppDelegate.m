//
//  AppDelegate.m
//  CopyWeibo
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "Common.h"
#import "QYTabbarVIewController.h"
#import "QYNewFeatureViewController.h"
#import "QYOAuthViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2 设置跟视图控制器
    self.window.rootViewController = [[QYOAuthViewController alloc] init];
    
//    //存储在沙盒中的版本号(上一次打开的版本号)
//    NSString *key = [NSString stringWithFormat:@"CFBundleVersion"];
//    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
//    QYLog(@"%@",lastVersion);
//    //获得当前软件的版本号(info.plist)
//    NSString *info = [NSBundle mainBundle].infoDictionary[key];
//    QYLog(@"%@",info);
//    
//    if ([info isEqualToString:lastVersion]) {
//        self.window.rootViewController = [[QYTabbarVIewController alloc] init];
//    }else{
//        
//        self.window.rootViewController = [[QYNewFeatureViewController alloc] init];
//        //将版本号存进沙盒
//        [[NSUserDefaults standardUserDefaults] setObject:info forKey:key];
//        //把文件立即同步到沙盒中
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }

    //3 显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
