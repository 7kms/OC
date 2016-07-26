//
//  TLMeViewController.m
//  login
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLMeViewController.h"

@interface TLMeViewController (){
    UILabel *_lbUserInfo;
}

@end

@implementation TLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //信息显示标签
    _lbUserInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    _lbUserInfo.textAlignment = NSTextAlignmentCenter;
    _lbUserInfo.textColor = [UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1];
    [self.view addSubview:_lbUserInfo];
    
    //关闭按钮
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeSystem];
    btnClose.frame = CGRectMake(110, 200, 100, 30);
    [btnClose setTitle:@"关闭" forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];
    //设置传值信息
    _lbUserInfo.text = _userInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) close{

    [self dismissViewControllerAnimated:YES completion:nil];
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
