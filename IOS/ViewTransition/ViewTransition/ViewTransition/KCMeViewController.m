//
//  KCMeViewController.m
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCMeViewController.h"

@interface KCMeViewController (){
    UILabel *_lbUserInfo;
}

@end

@implementation KCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //信息显示标签
    _lbUserInfo =[[UILabel alloc]initWithFrame:CGRectMake(0, 100,320 ,30)];
    _lbUserInfo.textAlignment=NSTextAlignmentCenter;
    _lbUserInfo.textColor=[UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1];
    [self.view addSubview:_lbUserInfo];
    
    //关闭按钮
    UIButton *btnClose=[UIButton buttonWithType:UIButtonTypeSystem];
    btnClose.frame=CGRectMake(110, 200, 100, 30);
    [btnClose setTitle:@"关闭" forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];
    
    //设置传值信息
    _lbUserInfo.text=_userInfo;
}

#pragma mark 关闭
-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
