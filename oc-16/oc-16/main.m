//
//  main.m
//  oc-16
//
//  Created by tangliang on 16/7/19.
//  Copyright © 2016年 tangliang. All rights reserved.
//
#pragma mark 文件拷贝
/*
 可变对象: 当值发生了改变,那么地址也随之发生改变;
 不可变对象: 当值发生了改变,类容首地址不发生变化;
 引用计数器: 用于计算一个对象有几个指针在引用(有几个指针变量指向同一个内存地址)
 */


/*
 在oc中有两种方式的拷贝: copy和mutablecopy 这两种方式都将产生一个新的对象,只是后者产生的是一个可变对象.
 在oc中如果想要实现copy或者mutablecopy操作需要实现NSCopy或者NSMutableCopy协议,拷贝操作产生的新的对象默认引用计数器是1.
 在非ARC模式下我们应该对这个对象进行内存管理.
 
 
 浅复制：在执行复制操作时，对于对象中每一层（对象中包含的对象，例如说属性是某个对象类型）复制都是指针复制（如果从引用计数器角度出发，那么每层对象的引用计数器都会加1）。
 深复制：在执行复制操作时，至少有一个对象的复制是对象内容复制（如果从引用计数器角度出发，那么除了对象内容复制的那个对象的引用计数器不变，其他指针复制的对象其引用计数器都会加1）。
 
 
 
 指针拷贝:拷贝的是指针本身（也就是具体对象的地址）而不是指向的对象内容本身。
 对象复制：对象复制指的是复制内容是对象本身而不是对象的地址。
 完全复制：上面说了深复制和浅复制，既然深复制是至少一个对象复制是对象内容复制，那么如果所有复制都是对象内容复制那么这个复制就叫完全复制。
 */


/*
 retain: 始终采取浅复制,引用计数器会加1,返回的对象和被复制的对象是同一个对象(也就是说对象的引用多了一个,或者说是指向这个对象的指针多了一个)
 copy: 对于不可变对象copy采用的是浅复制,引用计数加1;对于可变对象copy采用的是深复制,引用计数器不变
 
 mutablecopy: 无论是可变对象还是不可变对象采取的都是深复制,引用计数器不变
 
 
 */
#import <Foundation/Foundation.h>


void test1(){

    NSString *name = @"xiaosan.";
    NSString *str1 = [NSString stringWithFormat:@"I'm %@",name];//注意此时str1的计数器是1
    NSLog(@"%lu",[str1 retainCount]);
    NSMutableString *str2 = [str1 mutableCopy];//注意此时str2的计数器为1,str1的计数器还是1
    NSLog(@"retainCount(str1) = %lu,retainCount(str1)=%lu",[str1 retainCount],[str2 retainCount]);
    
    
    [str2 appendString:@"def"];//改变str2,str1不变
    NSLog(@"%zi",str1 == str2);//二者不是同一个对象,结果是0
    NSLog(@"str1 = %@",str1);
    NSLog(@"str2 = %@",str2);
    
    NSLog(@"str1's %lu",[str1 retainCount]);
    NSString *str3 = [str1 copy];//str3  不是产生的新对象而是复制了对象的指针,但是str1的计数器+1(既然str3同样指向同一个对象,那么如果计算str3指向的对象引用计数器肯定等于str1的对象引用计数器)
    NSLog(@"%zi",str1 == str3);//二者相等,指向同一个对象,结果1
    NSLog(@"retainCount(str1)=%lu,retainCount(str3)=%lu",str1.retainCount,str3.retainCount);
    
    //需要注意的是使用copy和mutableCopy是深复制还是浅复制不是绝对,关键是看什么对象产生什么样的对象
    NSString *str4 = [str2 copy];// 由NSMutableString产生了NSString,二者类型都不同肯定是深拷贝,此时str2的计数器还是1,str4的计数器也是1
    [str2 appendString:@"g"];//改变源对象不会影响str4
    NSLog(@"%zi",str2 == str4);
    NSLog(@"str2=%@",str2);
    NSLog(@"str4=%@",str4);
    [str1 release];
    str1 = nil;
    [str3 release];
    str3 = nil;
    [str4 release];
    str4 = nil;
    //上面只有一种情况是浅拷贝: 不可变对象调用copy方法
    
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
    }
    return 0;
}
