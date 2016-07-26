//
//  TLContactViewController.m
//  ios8-UITabBarView
//
//  Created by tangliang on 16/7/25.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLContactViewController.h"

@interface TLContactViewController ()

@end

@implementation TLContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.tabBarItem.title = @"Contact";
    self.tabBarItem.image = [UIImage imageNamed:@"phone-off"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"phone-on"];
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
