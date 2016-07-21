//
//  ViewController.m
//  ios-05
//
//  Created by 魔方 on 16/7/20.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //添加scrollView控件
    //注意UIScreen代表当前屏幕对象,其applicationFrame是当前屏幕内容区域
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _scrollView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_scrollView];
    //添加图片控件
    UIImage *image = [UIImage imageNamed:@"img-1"];
    _imageView = [[UIImageView alloc] initWithImage:image];
    [_scrollView addSubview:_imageView];
    
    //contentSize必须设置，否则无法滚动，当前设置为图片大小
    _scrollView.contentSize = _imageView.frame.size;
    //实现缩放：maxinumZoomScale必须大于minimumZoomScale同时实现viewForZoomingInScrollView方法
    _scrollView.maximumZoomScale = 1.8;
    _scrollView.minimumZoomScale = 0.6;
    //设置代理
    _scrollView.delegate = self;
    
    
    //边距，不属于内容部分，内容坐标（0，0）指的是内容的左上角不包括边界
    //_scrollView.contentInset=UIEdgeInsetsMake(10, 20, 10, 20);
    
    //显示滚动内容的指定位置
    //_scrollView.contentOffset=CGPointMake(10, 0);
    
    //隐藏滚动条
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator=NO;
    
    //禁用弹簧效果
    //_scrollView.bounces=NO;
}
#pragma mark 实现缩放视图代理方法，不实现此方法无法缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //即将停止滚动事件方法（拖拽松开后开始减速时执行）
    NSLog(@"scrollViewWillBeginDecelerating");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //滚动停止事件方法（滚动过程中减速停止后执行）
    NSLog(@"scrollViewDidEndDecelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //开始拖拽事件方法
    NSLog(@"scrollViewWillBeginDragging");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //拖拽操作完成事件方法
    NSLog(@"scrollViewDidEndDragging");
}
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    //开始缩放事件方法
    NSLog(@"scrollViewWillBeginZooming");
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    //缩放操作完成事件方法
    NSLog(@"scrollViewDidEndZooming");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
