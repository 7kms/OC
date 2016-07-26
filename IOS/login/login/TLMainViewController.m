//
//  TLMainViewController.m
//  login
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLMainViewController.h"
#import "TLLoginViewController.h"
#import "TLMeViewController.h"

@interface TLMainViewController ()<TLMainDelegate,UIActionSheetDelegate>{
    UILabel *_loginInfo;
    UIBarButtonItem *_loginButton;
    UIBarButtonItem *_meButton;
    BOOL _islogin;
}

@end

@implementation TLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"mainViewController viewDidload");
    [self addNavigationBar];
    [self addLoginInfo];
}

#pragma mark 添加信息显示
-(void)addLoginInfo{
    NSLog(@"add loginINfo");
    _loginInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    _loginInfo.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_loginInfo];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addNavigationBar{
    NSLog(@"addNavigationBar");
    //创建一个导航栏
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    //navigationBar.tintColor = [UIColor redColor];
    [self.view addSubview:navigationBar];
    //创建导航栏内容
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"web chat"];
    
    //左侧添加登录按钮
    _loginButton = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(login)];
    
    navigationItem.leftBarButtonItem = _loginButton;
    
    _meButton = [[UIBarButtonItem alloc] initWithTitle:@"我" style:UIBarButtonItemStyleDone target:self action:@selector(showInfo)];
    _meButton.enabled = NO;
    navigationItem.rightBarButtonItem = _meButton;
    
    //添加类容到导航栏
    [navigationBar pushNavigationItem:navigationItem animated:NO];
}
#pragma mark 登录
-(void)login{
    if(!_islogin){
        TLLoginViewController *loginController = [[TLLoginViewController alloc] init];
        loginController.delegate = self;//设置代理
        //调用此方法显示模态窗口
        [self presentViewController:loginController animated:YES completion:nil];
    }else{
        //如果登录之后则处理注销的情况
        //注意当前视图控制器必须实现UIActionSheet代理才能进行操作
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"系统信息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil];
        [actionSheet showInView:self.view];
    }
}
#pragma mark 点击查看我的信息
-(void)showInfo{
    if(_islogin){
        TLMeViewController *meController = [[TLMeViewController alloc]init];
        meController.userInfo = _loginInfo.text;
        [self presentViewController:meController animated:YES completion:nil];
    }
}
#pragma mark 实现代理方法
-(void)showUserInfoWithUserName:(NSString *)userName{
    _islogin = YES;
    _loginInfo.text = [NSString stringWithFormat:@"Hello,%@",userName];
    _loginButton.title = @"注销";
    _meButton.enabled=YES;
}
#pragma mark 实现注销方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        //注销按钮
        _islogin = NO;
        _loginButton.title = @"登录";
        _loginInfo.text = @"";
        _meButton.enabled=NO;
    }
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
