//
//  ViewController.h
//  IOS
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

#pragma mark 手机号码
//IBOutlet 没有做任何操作，它唯一的作用就是告诉 Interface Builder 这个属性可以被关联到其中某个控件（在代码中可以看到前面多了空心圆点）
@property (nonatomic,strong) IBOutlet UITextField *phoneNumber;
#pragma mark 密码
@property (nonatomic,strong) IBOutlet UITextField *password;
#pragma mark 密码
@property (strong, nonatomic) IBOutlet UITextField *verifyCode;
#pragma mark 点击事件
//IBAction 其实就是void。定义为IBAction在Interface Builder中可以关联到某个控件的事件方法 （在代码中可以看到前面多了空心圆点）
-(IBAction)login:(UIButton *)btn;
@end

