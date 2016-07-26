//
//  KCQQContactViewController.m
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCQQContactViewController.h"
#import "KCPublicAccountViewController.h"

@interface KCQQContactViewController ()

@end

@implementation KCQQContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //每次出栈都会销毁相应的子控制器
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);
    
    [self setTitle:@"QQ Contact"];
    //self.title=@"QQ contact";
    //self.navigationItem.title=@"My QQ";
    
    UIBarButtonItem *back=[[UIBarButtonItem alloc]initWithTitle:@"QQ" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem=back;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Public Account" style:UIBarButtonItemStyleDone target:self action:@selector(gotoNextView)];
}

-(void)gotoNextView{
    KCPublicAccountViewController *publicAccountController=[[KCPublicAccountViewController alloc]init];
    [self.navigationController pushViewController:publicAccountController  animated:YES];
}
@end
