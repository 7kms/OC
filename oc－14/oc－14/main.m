//
//  main.m
//  oc－14
//
//  Created by 魔方 on 16/7/18.
//  Copyright © 2016年 魔方. All rights reserved.
//
/*
 
 数组和字典中只能存储对象类型，其他基本类型和结构体是没有办法放到数组和字典中的，
 当然你也是无法给它们发送消息的（也就是说有些NSObject的方法是无法调用的），
 这个时候通常会用到装箱（boxing）和拆箱（unboxing）。
 其实各种高级语言基本上都有装箱和拆箱的过程，例如C#中我们将基本数据类型转化为Object就是一个装箱的过程，
 将这个Object对象转换为基本数据类型的过程就是拆箱，而且在C#中装箱的过程可以自动完成，
 基本数据类型可以直接赋值给Object对象。但是在ObjC中装箱的过程必须手动实现，ObjC不支持自动装箱
 
 */
/*
 在ObjC中我们一般将基本数据类型装箱成NSNumber类型（当然它也是NSObject的子类，但是NSNumber不能对结构体装箱），调用其对应的方法进行转换：
 
 +(NSNumber *)numberWithChar:(char)value;
 
 +(NSNumber *)numberWithInt:(int)value;
 
 +(NSNumber *)numberWithFloat:(float)value;
 
 +(NSNumber *)numberWithDouble:(double)value;
 
 +(NSNumber *)numberWithBool:(BOOL)value;
 
 +(NSNumber *)numberWithInteger:(NSInteger)value;
 
 拆箱的过程就更加简单了，可以调用如下方法：
 
 -(char)charValue;
 
 -(int)intValue;
 
 -(float)floatValue;
 
 -(double)doubleValue;
 
 -(BOOL)boolValue;

 */

#import <Foundation/Foundation.h>


#pragma mark 存放基本类型到数组，字典
void test1(){
    //包装类NSNumber ，可以包装基本类型但是无法包装结构体类型
    NSNumber *num1 = [NSNumber numberWithChar:'a'];//'a'是一个c语言的char类型我们无法放到NSArray中，但是我们可以通过NSNumber包装
    NSArray *arr1 = [NSArray arrayWithObject:num1];
    NSLog(@"%@",arr1);
    NSNumber *num2 = [arr1 lastObject];
    NSLog(@"%@",num2);//返回结果不是基本类型，返回97
    char char1 = [num2 charValue];//number转化为char
    NSLog(@"%c",char1);
    NSLog(@"%c",'f');
    
}
#pragma mark 存放结构体,oc自带的结构体
/*
 
 对于常用的结构体Foundation已经为我们提供好了具体的装箱方法：
 +(NSValue *)valueWithPoint:(NSPoint)point;
 +(NSValue *)valueWithSize:(NSSize)size;
 +(NSValue *)valueWithRect:(NSRect)point;
 对应的拆箱方法：
 -(NSPoint)pointValue;
 -(NSSize)sizeValue;
 -(NSRect)rectValue;
 
 */
void test2(){
    //NSNumber 是NSvalue的子类，而NSValue可以包装任何类型，包括结构体
    CGPoint point1 = CGPointMake(10, 20);
    //对于系统自带的结构体类型一般都有直接的方法进行包装
    NSValue *value1 = [NSValue valueWithPoint:point1];
    NSArray *arr = [NSArray arrayWithObject:value1];//放到数组当中
    NSLog(@"%@",arr);
    NSValue *value2 = [arr lastObject];
    CGPoint point2 = [value2 pointValue];//对于系统自带的结构体有对应的取值方法
    NSLog(@"x=%.2f,y=%.2f",point2.x,point2.y);

}
#pragma mark 存放自定义结构体
/*
 装箱
 +(NSValue *)valueWithBytes:(const void *)value objCType:(const char*)type;
 
 拆箱
 -(void)getValue:(void *)value;
 */

void test3(){

    typedef struct{
        int year;
        int month;
        int day;
    } Date;
    
    Date date = {2016,6,6};
    char *type = @encode(Date);
    NSValue *value = [NSValue value:&date withObjCType:type];//第一参数传递结构体地址，第二参数传递类型字符串
    NSArray *arr = [NSArray arrayWithObject:value];
    NSLog(@"%@",arr);
    
    
    Date date2;
    [value getValue:&date2];//取出对应的结构体，注意没有返回值
    //[value objCType];//取出包装内容的类型
    NSLog(@"%i,%i,%i",date2.year,date2.month,date2.day);
    
    //NSLog(@"%@",);
}
#pragma mark 扩展NSNull
/*
 oc无论在数组还是字典中都必须以nil结尾，否则数组或字典无法判断是否这个数组或字典已经结束。
 如果想在数组或者字典中存储nil值而不是作为结束标记，这时候使用NSNull，这个类是一个单例，只有一个null方法
 */
void test4(){
    NSNull *nl = [NSNull null];//注意这是一个对象，是一个单例，只有一个方法null创建一个对象
    NSNull *nl2 = [NSNull null];
    NSLog(@"%i", nl == nl2);//由于是单例所以地址相等
    
    NSArray *arr = [NSArray arrayWithObjects:@"abc",nl,@123, nil];
    NSLog(@"%@",arr);

}
#pragma mark 扩展@
void test5(){
    typedef enum{
        spring,
        summer,
        autumn,
        winter
    } Season;
    NSNumber *num1 = @100;
    NSArray *arr1 = [NSArray arrayWithObjects:num1,@"abc",@"16",@'A',@16.7,@YES, nil];
    NSLog(@"%@",arr1);
    NSNumber *num2 = @(1+2*3);
    NSLog(@"%@",num2);
    NSNumber *num3 = @(autumn);
    NSLog(@"%@",num3);
    
    NSArray *arr2 = @[@"abc",@16,@'A',@16.7,@YES];//使用这种方式最后不用添加nil值
    NSLog(@"%@",arr2);
    NSLog(@"%@",arr2[2]);
    
    NSMutableArray *arr3 = [NSMutableArray arrayWithArray:arr2];
    NSLog(@"%@",arr3);
    arr3[0] = @"def";
    NSLog(@"%@",arr3[0]);
    NSDictionary *dic = @{@"a":@123,@"b":@'c',@"c":@YES};
    NSLog(@"%@",dic);
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithDictionary:dic];
    NSLog(@"%@",dic2);
    dic2[@"a"] = @456;
    NSLog(@"%@",dic2[@"a"]);
    for(id key in dic2){
        NSLog(@"%@ = %@",key, [dic2 valueForKey:key]);
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
        test2();
        test3();
        test4();
        test5();
    }
    return 0;
}
