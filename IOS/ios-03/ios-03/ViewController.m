//
//  ViewController.m
//  ios-03
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


/*
 
 typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    UIViewAutoresizingNone                 = 0, //不进行自动调整
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,//自动调整与superview左侧的距离，右侧保持不变
    UIViewAutoresizingFlexibleWidth        = 1 << 1,自动调整控件自身的宽度，保证与superview左右距离不变
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,自动调整与superview右侧距离，左侧距离保持不变
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,自动调整与superview顶部距离，底部距离保持不变
    UIViewAutoresizingFlexibleHeight       = 1 << 4,自动调整控件自身高度，保证与superview上下距离不变
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5 自动调整与superview底部距离，顶部距离保持不变
 };
 
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame = CGRectMake(60, 100, 200, 50);
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn.layer setMasksToBounds:YES];
    [_btn.layer setCornerRadius:5.0];
    [_btn setTitle:@"mofanghr.com" forState:UIControlStateNormal];
    /*
     autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin那么iOS如何处理呢？此时会自动调整左边的距离和控件自身宽度，右侧距离不变，同时保证左侧距离和控件宽度同等比例的调整（延长或缩短）。
     例如在iPhone 5中，如果一个按钮假设自身宽度为200，左右侧距离均为60（左侧和宽度比例3:10），当从竖屏旋转到横屏的时候（此时宽度由320变为568，注意如果有状态栏则宽度变为568-20=548），由于右侧边距不变为60，根据比例左侧边距应该是（568-60）*(3/13)=117，宽度为：（568-60）*(10/13)=391。
     
     */
    _btn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [_btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 屏幕旋转事件

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{

    NSLog(@"%@",NSStringFromCGRect(_btn.frame));
}
-(void) clicked:(UIButton *)btn{
    NSLog(@"%@",btn);
}
@end
