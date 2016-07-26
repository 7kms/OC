//
//  TLWebChatViewController.m
//  ios8-UITabBarView
//
//  Created by tangliang on 16/7/25.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLWebChatViewController.h"

@interface TLWebChatViewController ()

@end

@implementation TLWebChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    //设置视图控制器标题
    self.title = @"chat";
    
    //通过tabBarController或者parentViewController可以得到其父视图控制器(也就是TLTabBarViewController)
    NSLog(@"%i",self.tabBarController == self.parentViewController);//对于当前应用二者相等
    
    //设置图标,标题(tabBarItem是显示在tabBar上的标签)
    self.tabBarItem.title = @"web chat";//注意这个标题不设置默认在页签上显示视图控制器标题
    self.tabBarItem.image = [UIImage imageNamed:@"msg-off"];//设置图片
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"msg-on"];//设置选中图片
    //图标右上角内容
    self.tabBarItem.badgeValue = @"5";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
