//
//  TLFriendViewController.m
//  ios8-UITabBarView
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLFriendViewController.h"
#import "TLQQContactViewController.h"

@interface TLFriendViewController ()

@end

@implementation TLFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);
    //在子视图中可以通过navigationController属性访问导航控制器
    //同时对于当前子视图来说其父控制器就是其导航控制器
    NSLog(@"%i",self.navigationController == self.parentViewController);
    
    //在子视图(或者根视图)有一个navigationItem用于访问其导航信息
    self.navigationItem.title = @"Friends";//或者直接设置控制器title 如 [self setTitle:@"Friends"]
    //设置导航栏左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"EDIT" style:UIBarButtonSystemItemAdd target:nil action:nil];
    //设置导航栏右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"friend-add"] style:UIBarButtonItemStyleDone target:self action:@selector(addFriends)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addFriends{
    //通过push导航到另外一个子视图
    TLQQContactViewController *qqContactController = [[TLQQContactViewController alloc] init];
    [self.navigationController pushViewController:qqContactController animated:YES];
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
