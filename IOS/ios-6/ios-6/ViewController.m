//
//  ViewController.m
//  ios-6
//
//  Created by tangliang on 16/7/21.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 568
#define IMAGEVIEW_COUNT 3

@interface ViewController ()<UIScrollViewDelegate>{

    UIScrollView *_scrollView;
    UIImageView *_leftImageView;
    UIImageView *_centerImageView;
    UIImageView *_rightImgeView;
    UIPageControl *_pageControl;
    UILabel *_label;
    NSMutableDictionary *_imageData;//图片数据
    int _currentImageIndex;//当前图片索引
    int _imageCount;//图片总数
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadImageData];
    [self addScrollView];
    [self addImageView];
    [self addPageControl];
    [self addLabel];
    [self setDefaultImage];
    
    
}
#pragma mark 加载图片数据
-(void)loadImageData{
    //读取程序包中的资源文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"imageInfo" ofType:@"plist"];
    NSLog(@"%@",path);
    _imageData = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",_imageData);
    _imageCount = (int) _imageData.count;
    NSLog(@"%i",_imageCount);
}


#pragma mark 添加控件
-(void) addScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_scrollView];
    
    //设置代理
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(IMAGEVIEW_COUNT*SCREEN_WIDTH, SCREEN_HEIGHT);
    //设置当前显示的位置为中间图片
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //设置分页
    _scrollView.pagingEnabled = YES;
    //去掉滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
}


#pragma mark 添加图片三个控件
-(void)addImageView{
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_leftImageView];
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_centerImageView];
    _rightImgeView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _rightImgeView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_rightImgeView];
}

#pragma mark 设置默认显示图片
-(void) setDefaultImage{
    //加载默认图片
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-%i",_imageCount-1 ]];
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-%i",1 ]];
    _rightImgeView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-%i",2 ]];
    _currentImageIndex = 0;
    //设置当前页
    _pageControl.currentPage = _currentImageIndex;
    NSString *imageName = [NSString stringWithFormat:@"img-%i",_currentImageIndex];
    _label.text = _imageData[imageName];
    NSLog(@"%@",_label.text);
}
#pragma mark 添加分页控件
-(void) addPageControl{
    _pageControl  = [[UIPageControl alloc] init];
    //注意此方法可以根据页面返回UIPageControl合适的大小
    CGSize size = [_pageControl sizeForNumberOfPages:_imageCount];
    _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    _pageControl.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 100);
    //设置颜色
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    //设置当前页颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    //设置总页数
    _pageControl.numberOfPages = _imageCount;
    [self.view addSubview:_pageControl];
}

#pragma mark 添加信息描述控件

-(void) addLabel{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 30)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    [self.view addSubview:_label];
}

#pragma mark 滚动停止事件
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //重新加载图片
    [self reloadImage];
    //view视图移到中间
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //重新设置分页高亮
    _pageControl.currentPage = _currentImageIndex;
    //设置描述
    NSString *imageName = [NSString stringWithFormat:@"img-%i",_currentImageIndex];
    _label.text = _imageData[imageName];
}

#pragma mark 重新加载图片
-(void) reloadImage{

    int leftImageIndex,rightImageIndex;
    CGPoint offset = [_scrollView contentOffset];
    if(offset.x > SCREEN_WIDTH){
        //向右滑动
        _currentImageIndex = (_currentImageIndex +1)%_imageCount;
    }else if (offset.x < SCREEN_WIDTH){
        //向左滑动
        _currentImageIndex = (_currentImageIndex - 1)%_imageCount;
    }
    //设置居中的图片
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-%i",_currentImageIndex]];
    //重新设置左右图片
    leftImageIndex = (_currentImageIndex + _imageCount - 1)%_imageCount;
    rightImageIndex = (_currentImageIndex + 1)%_imageCount;
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-%i",leftImageIndex ]];
    _rightImgeView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-%i",rightImageIndex]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
