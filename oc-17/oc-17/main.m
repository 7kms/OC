//
//  main.m
//  oc-17
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#pragma mark 自定义类支持copy

void test1(){
    Person *person1 = [[Person alloc] init];
    NSMutableString *str1 = [NSMutableString stringWithString:@"xiaosan"];
    person1.name = str1;
    [str1 appendString:@"hehe"];
    NSLog(@"%@",str1);
    NSLog(@"%@",person1.name);
}
void test2(){
    Person *person = [[Person alloc] init];
    person.name = [NSMutableString stringWithString:@"xiaosan"];
    person.age = 18;
    Person *person2 = [person copy];
    //[person.name appendString:@"hehe"];
    NSLog(@"%@",person);
    NSLog(@"%@",person2);

}
void test3(){
   NSString *str1 = @"heh";
    NSLog(@"retainCount(str1)=%i",(unsigned long)str1.retainCount);
    [str1 retain];
     NSLog(@"retainCount(str1)=%i",(unsigned long)str1.retainCount);
    
    NSString *str2 = [NSString stringWithString:@"kar"];
    NSLog(@"retainCount(str2)=%i",str2.retainCount);
    [str2 retain];
    NSLog(@"retainCount(str2)=%i",str2.retainCount);
    
    
    
    NSString *str2_1 = [NSString stringWithString:[NSString stringWithFormat:@"hehe %@",@"oc" ]];
    NSLog(@"retainCount(str2_1) = %i",str2_1.retainCount);
    [str2_1 release];
    
    NSString *str3=[NSString stringWithFormat:@"Rosa %@",@"Sun"];
    NSLog(@"retainCount(str3)=%i",str3.retainCount);
    [str3 retain];
    NSLog(@"retainCount(str3)=%i",str3.retainCount);
    
   NSString *str4=[NSString stringWithUTF8String:"Jack"];
   NSLog(@"retainCount(str4)=%i",str4.retainCount);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
        test2();
        test3();
    }
    return 0;
}
