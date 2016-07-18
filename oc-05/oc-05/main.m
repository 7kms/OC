//
//  main.m
//  oc-05
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
void Test1(){
    Person *p = [[Person alloc] init];//调用alloc,引用计数器+1
    p.name = @"小三";
    p.age = 18;
    NSLog(@"retaionCount=%lu",[p retainCount]);
    [p release];
    //上面调用过release方法，p指向的对象就会被销毁，但是此时变量p中还存放着Person对象的地址，
    //如果不设置p=nil，则p就是一个野指针，它指向的内存已经不属于这个程序，因此是很危险的
    p = nil;
    //如果不设置p=nil，此时如果再调用对象release会报错，但是如果此时p已经是空指针了，
    //则在ObjC中给空指针发送消息是不会报错的
    [p release];
}

/*
 我们可以通过dealloc方法来查看是否一个对象已经被回收，如果没有被回收则有可能造成内存泄露。
 如果一个对象被释放之后，那么最后引用它的变量我们手动设置为nil，否则可能造成野指针错误，
 而且需要注意在ObjC中给空对象发送消息是不会引起错误的。
 */
void Test2(){
    Person *p = [[Person alloc] init];
    p.name = @"xiao";
    p.age = 18;
    NSLog(@"retaionCount=%lu",[p retainCount]);
    
    [p retain];
    NSLog(@"retaionCount=%lu",[p retainCount]);
    
    [p release];
    NSLog(@"retaionCount=%lu",[p retainCount]);
    
    [p release];
    p= nil;

}
void getCar(Person *p){
    Car *car1 = [[Car alloc] init];
    car1.no = @"1314";
    p.car = car1;
    NSLog(@"retainCount(p)=%lu",[p retainCount]);
    NSLog(@"retainCount(car1)=%lu",[car1 retainCount]);
    Car *car2 = [[Car alloc] init];
    car2.no = @"6666";
    [car1 release];
    car1 = nil;
    [car2 release];
    car2 = nil;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.name = @"xai";
        getCar(p);
        [p.car run];
        [p release];
        p = nil;
    }
    
    return 0;
}
