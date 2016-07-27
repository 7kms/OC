//
//  TLShakeViewController.m
//  ios-11-move
//
//  Created by 魔方 on 16/7/27.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "TLShakeViewController.h"
#import "TLImageView.h"

@interface TLShakeViewController (){
    TLImageView *_imageView;
}

@end

@implementation TLShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 视图显示时让控件变成第一响应者
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidApper...");
    _imageView = [[TLImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _imageView.userInteractionEnabled = true;
    [self.view addSubview:_imageView];
    [_imageView becomeFirstResponder];
}
#pragma mark 视图不显示时注销控件第一响应者的身份
-(void)viewDidDisappear:(BOOL)animated{
    [_imageView resignFirstResponder];
}

/*视图控制器的运动事件*/
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion begin...");
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion end.");
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
