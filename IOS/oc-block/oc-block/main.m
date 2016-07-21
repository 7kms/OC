//
//  main.m
//  oc-block
//
//  Created by 魔方 on 16/7/20.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 ^ 操作符声明一个块变量的开始，用；来表示表达式结束
 
 
 block的数据类型代表了匿名函数的格式（返回值类型，形参的类型）
 block变量的定义与函数指针变量的定义类似，唯一区别于函数指针变量的是变量名前通过脱字符^修饰
 
 首先应该用^修饰，剩余的部分与c语言函数定义一致，最大的不同就是没有函数名（同时返回值类型也可以省略）
 
 block变量在定义时具有变量定义的基本特征，赋值号右侧的匿名函数可以当作一个整体被赋值，类似于int a ＝ 5；
 block变量所赋值的值时匿名函数。又兼具函数的特征，并且是唯一可以定义在某个函数实现内部（c语言中认为函数是不能嵌套定义的，block是个特例）
 
 block 进行 typedef
 typedef int (^BlockType)(int x,int y)
 原类型: int(^)(int x,int y)
 新类型: BlockType
 类比函数指针的类型定义，格式与函数指针一致，类型定义一定程度上简化了block的使用
 typedef int(^SumType)(int,int);
 SumType sumBlock = ^(int x,int y){
    return x + y;
 };
 int result = sumBlock(5,4);
 NSLog(@"%d",result);
 */


#pragma mark 数组使用block排序
void test1(){
    NSArray *stringArray = [NSArray arrayWithObjects:@"abc 10",@"abc 21",@"abc 12",@"abc 13",@"abc 05", nil];
    NSComparator sortBlock = ^(id string1,id string2){
        return [string1 compare:string2];
        };
    NSArray *sortArray = [stringArray sortedArrayUsingComparator:sortBlock];
    NSLog(@"sortArray: %@",sortArray);
}
#pragma mark 数组使用block对两个字符串进行比较
void test2(){
    NSComparisonResult (^compareBlock)(NSString *,NSString *) = ^(NSString *str1,NSString *str2){
        //如果是升序 返回－1，如果是降序返回1，如果想等返回0
        return [str1 compare:str2];
    };
    NSLog(@"%ld",compareBlock(@"11",@"12"));
}
#pragma mark 数组默认排序
void test3(){
    // [array sortedArrayUsingSelector: @selector(compare:)]
    // [mutableArray sortUsingSelector:  @selector(compare:)]
    // @selector,获取方法名。这个方法名是数组中元素的方法
    // 默认使用升序排列
    NSArray *arr = @[@1,@2,@13,@12,@23];
    NSArray *resultArray1 = [arr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",resultArray1);
    //数组使用block排序 降序排列
    NSComparator sortBlock = ^(id obj1,id obj2){
        return [obj2 compare:obj1];
    };
    NSArray *resultArray2 = [arr sortedArrayUsingComparator:sortBlock];
    NSLog(@"%@",resultArray2);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //^返回值类型（参数列表）{函数体}其中返回值类型可以省略
        int (^myBlock)(NSString *) = ^(NSString *string) {
            return [string intValue];
        };
        
        NSLog(@"%d",myBlock(@"dada15"));
        
        int multiplier = 7;
        int(^otherBlock)(int) = ^(int num){
            return num*multiplier;
        };
        NSLog(@"%d",otherBlock(2));
        
        typedef int(^SumType)(int,int);
        SumType sumBlock = ^(int x,int y){
            return x + y;
        };
        int result = sumBlock(5,4);
        NSLog(@"%d",result);
        
        
        
         //__block类型标识可以运行局部变量在其后续定义的block内部正常访问
        
        
        __block int num = 0;
        __block int count = 0;
        void(^testBlock)() = ^(){
            for (int i=0;i<10;i++){
                count++;
                num++;
                NSLog(@"%d",count);
            }
        };
        testBlock();
        
        
        test1();
        test2();
        test3();
    }
    return 0;
}
