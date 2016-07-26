//
//  KCWorldClockViewController.m
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCWebChatViewController.h"

@interface KCWebChatViewController ()

@end

@implementation KCWebChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithRed:51/255.0 green:162/255.0 blue:235/255.0 alpha:1];
    
    //设置视图控制器标题
    self.title=@"Chat";
    
    //注意通过tabBarController或者parentViewController可以得到其俯视图控制器（也就是KCTabBarViewController）
    NSLog(@"%i",self.tabBarController==self.parentViewController);//对于当前应用二者相等
    
    //设置图标、标题(tabBarItem是显示在tabBar上的标签)
    self.tabBarItem.title=@"Web Chat";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    self.tabBarItem.image=[UIImage imageNamed:@"tabbar_mainframe.png"];//默认图片
    self.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_mainframeHL.png"];//选中图片
    
    //图标右上角内容
    self.tabBarItem.badgeValue=@"5";
    
}
@end
