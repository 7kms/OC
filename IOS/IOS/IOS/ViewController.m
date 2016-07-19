//
//  ViewController.m
//  IOS
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

/*

    视图控制器，主要负责管理UIView的生命周期、负责UIView之间的切换、对UIView事件进行监听等
 
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)login:(UIButton *)btn{
    if([_phoneNumber.text isEqual:@"123"] && [_password.text isEqualToString:@"456"]){
        NSLog(@"login successfully");
    }

}

@end
