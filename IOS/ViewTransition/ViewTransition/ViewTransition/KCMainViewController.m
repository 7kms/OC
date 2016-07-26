//
//  KCMainViewController.m
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCMainViewController.h"
#import "KCLoginViewController.h"
#import "KCMeViewController.h"



@interface KCMainViewController ()<KCMainDelegate,UIActionSheetDelegate>{
    UILabel *_loginInfo;
    UIBarButtonItem *_loginButton;
    UIBarButtonItem *_meButton;
    BOOL _isLogon;
}

@end

@implementation KCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationBar];
    
    [self addLoginInfo];
}

#pragma mark 添加信息显示
-(void)addLoginInfo{
    _loginInfo =[[UILabel alloc]initWithFrame:CGRectMake(0, 100,320 ,30)];
    _loginInfo.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:_loginInfo];
}

#pragma mark 添加导航栏
-(void)addNavigationBar{
    //创建一个导航栏
    UINavigationBar *navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44+20)];
    //navigationBar.tintColor=[UIColor whiteColor];
    [self.view addSubview:navigationBar];
    //创建导航控件内容
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"Web Chat"];
    
    //左侧添加登录按钮
    _loginButton=[[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(login)];
    
    navigationItem.leftBarButtonItem=_loginButton;
    
    //左侧添加导航
    _meButton=[[UIBarButtonItem alloc]initWithTitle:@"我" style:UIBarButtonItemStyleDone target:self action:@selector(showInfo)];
    _meButton.enabled=NO;
    navigationItem.rightBarButtonItem=_meButton;
    
    //添加内容到导航栏
    [navigationBar pushNavigationItem:navigationItem animated:NO];
}

#pragma mark 登录操作
-(void)login{
    if (!_isLogon) {
        KCLoginViewController *loginController=[[KCLoginViewController alloc]init];
        loginController.delegate=self;//设置代理
        //调用此方法显示模态窗口
        [self presentViewController:loginController animated:YES completion:nil];
    }else{
        //如果登录之后则处理注销的情况
        //注意必须实现对应代理
        UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"系统信息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles: nil];
        [actionSheet showInView:self.view];
    }
}
#pragma mark 点击查看我的信息
-(void)showInfo{
    if (_isLogon) {
        KCMeViewController *meController=[[KCMeViewController alloc]init];
        meController.userInfo=_loginInfo.text;
        [self presentViewController:meController animated:YES completion:nil];
    }
}

#pragma mark 实现代理方法
-(void)showUserInfoWithUserName:(NSString *)userName{
    _isLogon=YES;
    //显示登录用户的信息
    _loginInfo.text=[NSString stringWithFormat:@"Hello,%@!",userName];
    //登录按钮内容改为“注销”
    _loginButton.title=@"注销";
    _meButton.enabled=YES;
}

#pragma mark 实现注销方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {//注销按钮
        _isLogon=NO;
        _loginButton.title=@"登录";
        _loginInfo.text=@"";
        _meButton.enabled=NO;
    }
}
@end
