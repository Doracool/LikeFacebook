//
//  QYHomeViewController.m
//  CopyWeibo
//
//  Created by qingyun on 16/1/24.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYHomeViewController.h"
#import "QYDropdownMenu.h"
#import "QYTitleMenuViewController.h"
@interface QYHomeViewController ()<QYDropdownMenuDelegate>

@end

@implementation QYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(friendseach) Image:@"navigationbar_friendsearch" HighImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self Action:@selector(pop) Image:@"navigationbar_pop" HighImage:@"navigationbar_pop_highlighted"];
    
    //中间的标题按钮
    UIButton *titleButton = [[UIButton alloc] init];
    titleButton.width = 150;
    titleButton.height = 30;
    
    //设置图片和文字
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    
}

/**
 *  点击标题
 */
- (void)titleClick:(UIButton *)titleBUtton
{
    //创建下拉菜单
    QYDropdownMenu *menu = [QYDropdownMenu menu];
    menu.delegate = self;
//    menu.content = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    QYTitleMenuViewController *vc = [[QYTitleMenuViewController alloc] init];
    vc.view.height = 44 * 3;
    vc.view.width = 150;
    menu.contentControler = vc;
    //显示
    [menu showFrom:titleBUtton];
    
}
-(void)friendseach{
    NSLog(@"friendseach");
}

-(void)pop{
    NSLog(@"pop");
}

-(void)dropdownMenuDismiss:(QYDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = NO;
}
-(void)dropdownMenuDisShow:(QYDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
