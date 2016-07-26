//
//  TLLoginViewController.m
//  login
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLLoginViewController.h"
#import "TLMainViewController.h"

@interface TLLoginViewController (){
    UITextField *_txtUserName;
    UITextField *_txtPwd;
}

@end

@implementation TLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addLoginForm];
}
-(void)addLoginForm{
    //用户名
    UILabel *lbUserName = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 100, 30)];
    lbUserName.text = @"用户名";
    [self.view addSubview:lbUserName];
    _txtUserName = [[UITextField alloc] initWithFrame:CGRectMake(120, 150, 150, 30)];
    _txtUserName.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_txtUserName];
    //密码
    UILabel *lbPwd = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 100, 30)];
    lbPwd.text = @"密码";
    [self.view addSubview:lbPwd];
    
    _txtPwd = [[UITextField alloc] initWithFrame:CGRectMake(120, 200, 150, 30)];
    _txtPwd.secureTextEntry = YES;
    _txtPwd.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_txtPwd];
    
    //登录按钮
    UIButton *btnLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    btnLogin.frame = CGRectMake(120, 270, 80, 30);
    [btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:btnLogin];
    [btnLogin addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];


    //取消登录按钮
    UIButton *btnCancel = [UIButton buttonWithType:UIButtonTypeSystem];
    btnCancel.frame = CGRectMake(170, 270, 80, 30);
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [self.view addSubview:btnCancel];
    [btnCancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 登录操作
-(void)login{
    
    if([_txtUserName.text isEqualToString:@"abc"] && [_txtPwd.text isEqualToString:@"123"]){
        //调用代理方法传参
        [self.delegate showUserInfoWithUserName:_txtUserName.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"系统信息" message:@"用户名或者密码错误,请重新登录" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alertView show];
    }
}
-(void) cancel{

    [self dismissViewControllerAnimated:YES completion:nil];
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
