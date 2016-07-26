//
//  TLQQContactViewController.m
//  ios8-UITabBarView
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLQQContactViewController.h"
#import "TLPublicAccountViewController.h"

@interface TLQQContactViewController ()

@end

@implementation TLQQContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"childviewControllers:%@",self.navigationController.childViewControllers);
    [self setTitle:@"QQContact"];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"QQ" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"public account" style:UIBarButtonItemStyleDone target:self action:@selector(gotoNextView)];
    
}
-(void)gotoNextView{
    TLPublicAccountViewController *publicAccountController = [[TLPublicAccountViewController alloc] init];
    [self.navigationController pushViewController:publicAccountController animated:YES];
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
