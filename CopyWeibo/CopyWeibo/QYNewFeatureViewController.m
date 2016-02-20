//
//  QYNewFeatureViewController.m
//  CopyWeibo
//
//  Created by qingyun on 16/2/20.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYNewFeatureViewController.h"

@interface QYNewFeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic ,strong) UIPageControl *pageControl;
@property (nonatomic ,strong) UIScrollView *scrollView;
@end

@implementation QYNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建一个scrollView，显示新特性的图片
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(QYNewfeatureCount * scrollView.width, 0);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;

    //添加图片到scrollView
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i < QYNewfeatureCount ; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.size = scrollView.size;
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        NSString *name = [NSString stringWithFormat:@"helper_authority_%d_guide",i];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        //设置scrollview 的其他属性
        scrollView.bounces = NO;//去除弹簧效果
        scrollView.pagingEnabled = YES;//设置分页
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        
        //添加pageControl
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = QYNewfeatureCount;
        [self.view addSubview:_pageControl];
        _pageControl.centerX = scrollW * 0.5;
        _pageControl.centerY = scrollH - 50;
        _pageControl.currentPageIndicatorTintColor = QYColor(253, 98, 42);
        _pageControl.pageIndicatorTintColor = QYColor(189, 189, 189);
//        pageControl.userInteractionEnabled = NO;//效果和不设置宽高一个效果
//        self.pageControl = pageControl;
        if (i == QYNewfeatureCount - 1) {
            [self setupImageView:imageView];
        }
        
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    
    self.pageControl.currentPage = (int)(page + 0.5);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupImageView:(UIImageView *)imageView
{
    //开启交互功能
    imageView.userInteractionEnabled = YES;
    
    //分享给大家
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"common_card_middle_background"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"common_icon_checkmark"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    shareBtn.width = 150;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.85;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [imageView addSubview:shareBtn];
    
    //开始微博
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"compose_keyboard_dot_selected"] forState:UIControlStateNormal];
    startBtn.size = CGSizeMake(100, 30);
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height * 0.8;
    [startBtn setTitle:@"进入微博" forState:UIControlStateNormal];
    [imageView addSubview:startBtn];
}

-(void)shareClick:(UIButton *)shareButton
{
    //状态取反
    shareButton.selected = !shareButton.isSelected;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
