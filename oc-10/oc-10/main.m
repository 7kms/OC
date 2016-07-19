//
//  main.m
//  oc-10
//
//  Created by 魔方 on 16/7/18.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 结构体
//常用的结构体有NSRange、NSPoint、NSSize、NSRect等



/*
 可以看到对于常用结构体在Foundation框架中都有一个对应的make方法进行创建，这也是我们日后比较常用的操作;
 而且与之对应的还都有一个NSStringFromXX方法来进行字符串转换，方便我们调试。
 NSSize其实就是CGSize，NSRect其实就是CGRect
 */


//NSRange 表示一个范围
void Test1(){
    NSRange rg = {3,5};
    //使用NSMakeRange定义一个NSRange
    NSRange rg2 = NSMakeRange(3, 5);
    //注意不能直接NSLog(@"rg2 is %@", rg2)，因为rg2不是对象（准确的说%@是指针）而是结构体
    NSLog(@"rg is %@",NSStringFromRange(rg));
    NSLog(@"rg is %@",NSStringFromRange(rg2));
}
//NSPoint 表示一个点
void Test2(){
    NSPoint p = NSMakePoint(10, 20);//NSPoint 其实就是CGPoint
    NSPoint p2 = CGPointMake(10, 15);
    NSLog(@"p is %@",NSStringFromPoint(p));
    NSLog(NSStringFromPoint(p2),nil);
}
//NSSize 表示大小
void Test3(){
    NSSize size = NSMakeSize(10, 20);
    CGSize s2 = CGSizeMake(10, 15);
    NSLog(NSStringFromSize(size),nil);
    NSLog(NSStringFromSize(s2),nil);
    
    
}
//NSRect 表示一个矩形
void Test4(){
    //NSRect 其实就是CGRect
    NSRect r = NSMakeRect(10, 6, 100, 200);
    //采用CGRectMake方式创建更为常见
    NSRect r2 = CGRectMake(10, 5, 100, 200);
    NSLog(NSStringFromRect(r),nil);
    NSLog(NSStringFromRect(r2),nil);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Test1();
        Test2();
        Test3();
        Test4();
    }
    return 0;
}
