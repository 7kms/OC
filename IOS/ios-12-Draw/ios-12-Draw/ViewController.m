//
//  ViewController.m
//  ios-12-Draw
//
//  Created by 魔方 on 16/7/28.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ViewController.h"
#import "TLView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TLView *view = [[TLView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
