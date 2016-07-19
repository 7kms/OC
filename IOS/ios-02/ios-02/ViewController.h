//
//  ViewController.h
//  ios-02
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
#pragma mark logo
@property (nonatomic,strong) UIImageView *logo;
#pragma mark 手机号码
@property (nonatomic,strong) UITextField *phoneNumber;
#pragma mark 密码
@property (nonatomic,strong) UITextField *password;
#pragma mark 登录按钮
@property (nonatomic,strong) UIButton *loginButton;


#pragma mark 点击事件
-(void) login:(UIButton *)btn;

@end

