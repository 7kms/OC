//
//  TLTabBarViewController.m
//  TANG
//
//  Created by 魔方 on 16/7/29.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "TLTabBarViewController.h"

@interface TLTabBarViewController ()

@end

@implementation TLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor =  [UIColor colorWithRed:234/255.0 green:168/255.0 blue:16/255.0 alpha:1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSString *title = item.title;
    if([title isEqualToString:@"table"]){
        self.navigationItem.title = @"table";
    }else if([title isEqualToString:@"my"]){
        self.navigationItem.title = @"my";
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
