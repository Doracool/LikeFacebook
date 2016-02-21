//
//  QYOAuthViewController.m
//  CopyWeibo
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYOAuthViewController.h"
#import "AFNetworking.h"
@interface QYOAuthViewController ()<UIWebViewDelegate>

@end

@implementation QYOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    // 2. 用webView加载登录界面
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=560495700&redirect_uri=https://api.weibo.com/oauth2/default.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //获取url
    NSString *url = request.URL.absoluteString;
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) {
        //截取code后边的参数
        int fromIndex = range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
        //利用code换取一个accessToken
        [self accessTokenWithCode:code];
    }
    return YES;
}

-(void)accessTokenWithCode:(NSString *)code
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //拼接请求对象
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"560495700";
    params[@"cliebt_secret"] = @"d80e37764fdbe9289709fe237fd08a22";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = @"https://api.weibo.com/oauth2/default.html";
    params[@"code"] = code;
    
    //发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        QYLog(@"请求成功 %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        QYLog(@"请求失败 %@",error);
    }];
}

@end
