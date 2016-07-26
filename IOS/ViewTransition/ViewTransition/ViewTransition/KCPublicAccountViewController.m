
//
//  KCPublicNumberViewController.m
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCPublicAccountViewController.h"

@interface KCPublicAccountViewController ()

@end

@implementation KCPublicAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //每次出栈都会销毁相应的子控制器
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);
    
    self.title=@"Public Account";
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Add Friends" style:UIBarButtonItemStyleDone target:self action:@selector(gotoAddFriends)];
    
}


-(void)gotoAddFriends{
    //直接跳转到根控制器，也可以- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated; 方法
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
