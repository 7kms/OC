//
//  main.m
//  oc-15
//
//  Created by tangliang on 16/7/18.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person1 = [Person personWithName:@"zhangsan"];
        NSLog(@"%i", [person1 isKindOfClass:[NSObject class]]);//判断一个对象是否为某种类型(如果是父类也返回YES)
        NSLog(@"%i", [person1 isMemberOfClass:[NSObject class]]);//判断一个对象是否是某个类的实例化对象
        NSLog(@"%i", [person1 isMemberOfClass:[Person class]]);
        NSLog(@"%i", [person1 conformsToProtocol:@protocol(NSCopying)]);//是否实现了某个协议
        NSLog(@"%i",[person1 respondsToSelector:@selector(showMessage:)]);//是否存在某个方法
        [person1 showMessage:@"hello,wrold!"];//直接调用一个方法
        
        
        
        //动态调用一个方法,注意如果有参数那么参数类型只能为oc对象,并且最多只能有两个参数
        [person1 performSelector:@selector(showMessage:) withObject:@"hello,world!"];
        [person1 performSelector:@selector(showMessage:) withObject:@"hello" withObject:@"world!"];
        
        
        
        /*反射*/
        
        //动态生成一个类
        NSString *className = @"Person";
        Class myClass = NSClassFromString(className);//根据类名生产类
        Person *person2 = [[myClass alloc] init];
        person2.name = @"bolb";
        NSLog(@"%@",person2);
    
        
        //类转化成为字符串
        NSLog(@"%@,%@",NSStringFromClass(myClass),NSStringFromClass([Person class]));
        
        
        //调用方法
        NSString *methodName = @"showMessage:";
        SEL mySelector = NSSelectorFromString(methodName);
        Person *person3 = [[myClass alloc] init];
        person3.name = @"Rosa";
        [person3 performSelector:mySelector withObject:@"hello,world!"];
        
        
        //方法转化为字符串
        NSLog(@"%@",NSStringFromSelector(mySelector));
    
    }
    return 0;
}
