//
//  TLTouchEventViewController.m
//  ios-9-touch
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLTouchEventViewController.h"
#import "TLImage.h"

@interface TLTouchEventViewController (){
    TLImage *_image;
}

@end

@implementation TLTouchEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _image = [[TLImage alloc] initWithFrame:CGRectMake(50, 50, 108.0, 192.0)];
    [self.view addSubview:_image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 视图控制器的触摸事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIViewController start touch...");
}
/*
 UITouch 类,当执行触摸事件时会将这个对象传入.在这个对象中包含了触摸的所有信息
 window:触摸时所在的窗口
 view:触摸时所在的视图
 tapCount:短时间内点击的次数
 timestamp:触摸产生或变化的时间戳
 phase:触摸周期内的各个状态
 locationInView:方法:取得在指定视图中的位置
 previousLocationInView:方法:取得移动的前一个位置
 */
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //取得一个触摸对象(对于多点触摸可能有多个对象)
    UITouch *touch = [touches anyObject];
    
    //取得当前位置
    CGPoint current = [touch locationInView:self.view];
    //取得前一个位置
    CGPoint previous = [touch previousLocationInView:self.view];
    //移动前的中间位置
    CGPoint center = _image.center;
    //移动偏移量
    CGPoint offset = CGPointMake(current.x - previous.x, current.y - previous.y);
    //重新设置新位置
    _image.center = CGPointMake(center.x + offset.x, center.y + offset.y);
    
    NSLog(@"UIViewController moving...");
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIViewController touch end...");
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
