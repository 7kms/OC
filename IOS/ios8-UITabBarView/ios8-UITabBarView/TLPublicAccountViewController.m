//
//  TLPublicAccountViewController.m
//  ios8-UITabBarView
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLPublicAccountViewController.h"

@interface TLPublicAccountViewController ()

@end

@implementation TLPublicAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //每次出栈都会销毁相应的子控制器
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);
    
    self.title = @"public account";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"add friends" style:UIBarButtonItemStyleDone target:self action:@selector(gotoAddFriends)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)gotoAddFriends{
    //直接跳转到根控制器
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
