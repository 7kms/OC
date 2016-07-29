//
//  ItemDetailViewController.m
//  TANG
//
//  Created by 魔方 on 16/7/29.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayOut];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initLayOut{
    self.navigationItem.title = _dynamictitle;
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 280, 200)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = _detail;
 
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
   // label.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.35];
   // label.shadowOffset = CGSizeMake(0, 1);
    [self.view addSubview:label];
}

+(ItemDetailViewController *)initWithTitle:(NSString *)title andDescription:(NSString *)detail{
    ItemDetailViewController *itemDetail = [[ItemDetailViewController alloc] initWithTitle:title andDescription:detail];
    return  itemDetail;
}
-(ItemDetailViewController *)initWithTitle:(NSString *)title andDescription:(NSString *)detail{
    self = [super init];
    if(self){
        self.title = title;
        self.detail = detail;
    }
    return  self;
}
@end
