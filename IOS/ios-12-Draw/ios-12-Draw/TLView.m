//
//  TLView.m
//  ios-12-Draw
//
//  Created by 魔方 on 16/7/28.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "TLView.h"

@implementation TLView


 //Only override drawRect: if you perform custom drawing.
 //An empty implementation adversely affects performance during animation.
#pragma mark 绘图
//绘图只能在此方法中调用，否则无法得到当前图形上下文
- (void)drawRect:(CGRect)rect {
    //1.取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.创建路径对象
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);//移动到指定位置（设置路径起点）
    CGPathAddLineToPoint(path, nil, 20, 100);//绘制直线（从起始位置开始）
    CGPathAddLineToPoint(path, nil, 300, 100);//绘制另外一条直线（从上一直线终点开始绘制）
    //3.添加路径到图形上下文
    CGContextAddPath(context, path);
    //4.设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);//设置笔触颜色
    CGContextSetRGBFillColor(context, 0, 1, 0, 1);//设置填充颜色
    CGContextSetLineWidth(context, 2);//设置线条宽度
    CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式（20，50）（300，100）是顶点
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置连结点样式，（20，100）是连接点
    /*
        设置线段样式
     phase:虚线开始的位置
     lengths:虚线长度间隔（下面的定义说明第一条线段长度为8，然后间隔3重新绘制8点的长度线段）
     count:虚线数组元素个数
     */
    //CGFloat lengths[2] = {18,9};
    //CGContextSetLineDash(context, 0, lengths, 2);
    /*
     设置阴影
     context:图形上下文
     offset:偏移量
     blur:模糊度
     color:阴影颜色
     */
    CGColorRef color = [UIColor grayColor].CGColor;//颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIKit提供了转化方法
    //CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.8, color);
    
    //5.绘制图像到指定图形上下文
    /*
        CGPathDrawingMode 是填充方式，枚举类型
     
        kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
        kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
        kCGPathStroke:只有边框
        kCGPathFillStroke:既有边框又有填充
        kCGPathEOFillStroke:奇偶填充并绘制边框
     */
    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型

    //6.释放对象
    CGPathRelease(path);
    [self drawLine:context];
    [self drawRectWithContext:context];
    [self drawRectByUIKitWithContext:context];
    [self drawEllipse:context];
    [self drawArc:context];
    [self drawCurve:context];
    [self drawText:context];
}

-(void)drawLine:(CGContextRef)context{
    CGContextMoveToPoint(context, 20, 150);
    CGContextAddLineToPoint(context, 20, 200);
    CGContextAddLineToPoint(context, 300, 200);
    CGContextClosePath(context);
    [[UIColor redColor]setStroke];
    [[UIColor greenColor]setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
}
#pragma mark 绘制矩形
-(void)drawRectWithContext:(CGContextRef)context{
    //添加矩形对象
    CGRect rect = CGRectMake(20, 220, 50, 50);
    CGContextAddRect(context, rect);
    //设置属性
    [[UIColor blueColor]set];
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}
#pragma mark 绘制矩形（利用UIKit的封装方法）
-(void)drawRectByUIKitWithContext:(CGContextRef)context{
    CGRect rect = CGRectMake(20, 280, 280, 50);
    CGRect rect2 = CGRectMake(20, 340, 280, 50);
    //设置属性
    [[UIColor yellowColor]set];
    UIRectFill(rect);//绘制矩形  只有填充
    [[UIColor redColor]setStroke];
    UIRectFrame(rect2);//绘制矩形（只有边框）
}
#pragma mark 绘制椭圆
-(void)drawEllipse:(CGContextRef)context{
    //添加对象，绘制椭圆（圆形）的过程也是先创建一个矩形
    CGRect rect = CGRectMake(100,30, 150, 150);
    CGContextAddEllipseInRect(context, rect);
    [[UIColor purpleColor]set];
    CGContextDrawPath(context, kCGPathFillStroke);
}
#pragma mark 绘制弧形
-(void)drawArc:(CGContextRef)context{
    /*
        添加弧形对象
     x 中心点x坐标
     y 中心点y坐标
     radius 半径
     startAngle 起始弧度
     endAngle 终止弧度
     closewise 是否逆时针绘制，0则顺时针绘制
     */
    CGContextAddArc(context, 160, 160, 100, 0, M_PI_2, 1);
    [[UIColor colorWithRed:0 green:99/255.0 blue:99/255.0 alpha:1]set];
    CGContextDrawPath(context, kCGPathFillStroke);
}
#pragma mark 绘制贝塞尔曲线
-(void)drawCurve:(CGContextRef)context{
    CGContextMoveToPoint(context, 200, 200);
    CGContextAddQuadCurveToPoint(context, 250, 250, 200, 300);
    [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1]setStroke];
    
    CGContextAddCurveToPoint(context, 80, 300, 240, 500, 300, 300);
    //设置图形上下文属性
    [[UIColor yellowColor]setFill];
    [[UIColor redColor]setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
}
#pragma mark 绘制文字
-(void)drawText:(CGContextRef)context{
    //绘制到指定的区域内容
    NSString *str=@"Star Walk is the most beautiful stargazing app you’ve ever seen on a mobile device. It will become your go-to interactive astro guide to the night sky, following your every movement in real-time and allowing you to explore over 200, 000 celestial bodies with extensive information about stars and constellations that you find.";
    CGRect rect = CGRectMake(20, 50, 280, 300);
    UIFont *font = [UIFont systemFontOfSize:18];
    UIColor *color = [UIColor redColor];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];//段落样式
    NSTextAlignment align = NSTextAlignmentLeft;
    style.alignment = align;
    [str drawInRect:rect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:style}];
}
@end
