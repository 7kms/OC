//
//  ViewController.m
//  ios-02
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //添加图片
    CGRect logoRect = CGRectMake(100, 50, 100, 60);
    _logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login.png"]];//设置图片
    _logo.contentMode = UIViewContentModeScaleAspectFit;//设置填充模式，以最长边充满容器进行缩放
    _logo.frame = logoRect;//设置控件大小和位置（相对于父控件的位置）
    [self.view addSubview:_logo];//添加到view当中
    
    //添加手机号码输入框
    CGRect phoneNumberRect = CGRectMake(20, 320, 280, 30);
    _phoneNumber = [[UITextField alloc] initWithFrame:phoneNumberRect];
    _phoneNumber.borderStyle = UITextBorderStyleRoundedRect;//设置文本框的边框样式
    _phoneNumber.placeholder = @"请输入手机号";
    [self.view addSubview:_phoneNumber];
    
    //添加密码输入框
    CGRect passwordRect = CGRectMake(20, 380, 280, 30);
    _password = [[UITextField alloc] initWithFrame:passwordRect];
    _password.borderStyle = UITextBorderStyleRoundedRect;
    _password.placeholder = @"请输入密码";
    [self.view addSubview:_password];
    
    //添加登录按钮
    CGRect loginButtonRect = CGRectMake(10, 440, 300, 25);
    _loginButton = [[UIButton alloc] initWithFrame:loginButtonRect];
    [_loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];//设置标题内容颜色
    
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];//设置按钮标题
    [_loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];//添加事件

    [self.view addSubview:_loginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)login:(UIButton *)btn{

    NSLog(@"login success!");
}

@end
