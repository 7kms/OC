//
//  ViewController.m
//  ios-04
//
//  Created by 魔方 on 16/7/20.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ViewController.h"


//定义rgb颜色
#define NORMAL_COLOR [UIColor colorWithRed:75/255.0 green:160/255.0 blue:253/255.0 alpha:1]
#define HIGHLIGHTED_COLOR [UIColor colorWithRed:197/255.0 green:221/225.0 blue:249/225.0 alpha:1]

//按钮操作
typedef void(^ ButtonHandle)();
@interface ViewController (){
    UIImageView *_imageView;//图片空间
    UIButton *_btnRotation;//旋转按钮
    UIButton *_btnScale;//缩放按钮
    UIButton *_btnTranslate;//移动按钮
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addImageView];
    [self addRotationButton];
    [self addScaleButton];
    [self addTranslateButton];
    
}
#pragma mark 添加图片控件
- (void)addImageView{
    //直接使用图片名称，系统会自动到资源文件中找到对应的文件
    UIImage *image = [UIImage imageNamed:@"app-iPhone"];
    //如果使用initWithImage进行初始化则控件大小会自动设置成图片大小
    _imageView = [[UIImageView alloc] initWithImage:image];
    _imageView.frame = CGRectMake(20, 20, 280, 154);
    _imageView.backgroundColor = [UIColor orangeColor];
    //以最长边进行等比缩放，最长边会填满整个容器
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    //self.view 就是每个视图控制器中的view属性
    [self.view addSubview:_imageView];
}
#pragma mark 添加旋转按钮
- (void)addRotationButton{
    _btnRotation = [self getButton];
    _btnRotation.frame = CGRectMake(20, 400, 280, 30);
    [_btnRotation setTitle:@"旋转" forState:UIControlStateNormal];
    //添加按钮点击事件
    [_btnRotation addTarget:self action:@selector(rotation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRotation];
}
#pragma mark 添加缩放按钮
- (void)addScaleButton{
    //在上面一个按钮位置的基础上确认当前位置
    CGRect scaleButtonFrame = _btnRotation.frame;
    //oc语法规定不允许直接修改一个对象的结构体属性的成员，只能给这个属性直接赋值为一个结构体类型,如果直接写成_btnScale.frame.origin.y = 380;是不正确的
    scaleButtonFrame.origin.y += 40;
    _btnScale = [self getButton];
    _btnScale.frame = scaleButtonFrame;
    [_btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    //添加按钮点击事件
    [_btnScale addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnScale];

}
#pragma mark 添加移动按钮
- (void)addTranslateButton{

    CGRect translateButtonFrame = _btnScale.frame;
    translateButtonFrame.origin.y += 40;
    _btnTranslate = [self getButton];
    _btnTranslate.frame = translateButtonFrame;
    [_btnTranslate setTitle:@"移动" forState:UIControlStateNormal];
    [_btnTranslate addTarget:self action:@selector(translate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnTranslate];
}
#pragma mark 图片旋转方法，注意参数中的btn表示当前点击按钮
- (void)rotation:(UIButton *)btn{
    [self animation: ^{
        //注意旋转角度必须是弧度，不是角度
        CGFloat angle = M_PI_4;//M开头的宏都是和数学（Math）相关的宏定义，M_PI_4 表示四分之派,M_2_PI表示2派
        //使用CGAffineTransformMakeRotation获得一个旋转角度形变
        //_imageView.transform = CGAffineTransformMakeRotation(angle);
        //但是需要注意transform的旋转不会自动在原来的角度上进行叠加，所以上面的方法旋转一次以后再点击按钮不会旋转了
        //利用CGAffineTransformRotate 在原来的基础上产生一个新的角度（当然也可以定义一个全局变量自己累加）
        _imageView.transform = CGAffineTransformRotate(_imageView.transform, angle);
    }];
}
#pragma mark 图片缩放方法
-(void)scale:(UIButton *)btn{
    [self animation:^{
        CGFloat scaleOffset = 0.9;
         _imageView.transform = CGAffineTransformScale(_imageView.transform, scaleOffset, scaleOffset);
    }];
    //通常我们使用UIView的animateWithDuration静态方法实现动画而不是自己写一个
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat scaleOffset = 0.9;
        _imageView.transform = CGAffineTransformScale(_imageView.transform, scaleOffset, scaleOffset);
    }];
}
#pragma mark 图片移动方法
- (void)translate:(UIButton *)btn{
    [self animation:^{
        CGFloat translateY = 50;
        _imageView.transform = CGAffineTransformTranslate(_imageView.transform, 0, translateY);
    }];

}
#pragma mark 动画执行方法，注意这里可以使用UIView的animateWithDuration方法替代，这里为了演示
- (void)animation:(ButtonHandle)handle{
    //开始动画
    [UIView beginAnimations:@"animate" context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    handle();
    //执行动画操作
    [UIView commitAnimations];
}
#pragma mark 取得一个按钮，统一按钮样式
- (UIButton *)getButton{
    UIButton *button = [[UIButton alloc] init];
    //设置正常状态下字体颜色
    [button setTitleColor:NORMAL_COLOR forState:UIControlStateNormal];
    //设置高亮状态下的字体颜色
    [button setTitleColor:HIGHLIGHTED_COLOR forState:UIControlStateHighlighted];
    return button;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
