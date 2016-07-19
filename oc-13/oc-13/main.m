//
//  main.m
//  oc-13
//
//  Created by 魔方 on 16/7/18.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 字典

#pragma mark 创建
void test1(){
    NSDictionary *dic1 = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
    NSLog(@"%@",dic1);
    //常用的方式
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1", @"a",
                          @"2", @"b",
                          @"3", @"c",
                          nil];
    NSLog(@"%@",dic2);
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"2",@"3", nil] forKeys:[NSArray arrayWithObjects:@"a",@"b",@"c", nil]];
    NSLog(@"%@",dic3);
    
    
    //更简单的方式 {key:value,key:value}
    NSDictionary *dic4 = @{@"1":@"a",@"2":@"b"};
    NSLog(@"%@",dic4);
    
}
#pragma mark 查找
void test2(){
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1", @"a",
                          @"2", @"b",
                          @"3", @"c",
                          @"4", @"d",
                          nil];
    
    NSLog(@"%zi",[dic1 count]);
    NSLog(@"%@", [dic1 valueForKey:@"c"]);
    NSLog(@"%@", dic1[@"b"]);
    NSLog(@"%@,%@", [dic1 allKeys], [dic1 allValues]);
    //notFoundMarker 是如果找不到对应的key用什么代替
    NSLog(@"%@",[dic1 objectsForKeys:[NSArray arrayWithObjects:@"aaa",@"a",@"b", @"e", nil] notFoundMarker:@"not found"]);
}
#pragma mark 遍历
void test3(){
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"1",@"a",
                          @"2",@"b",
                          @"3",@"c",
                          @"2",@"d",
                          nil];
    
    //对于字典的for遍历循环的是key
    for(id key in dic1){
        NSLog(@"%@ = %@",key, [dic1 valueForKey:key]);
    }
    
    //[dic1 keyEnumerator] key 的迭代器。 除此之外还有value的迭代器 [dic1 objectEnumerator]
    NSEnumerator *enumerator = [dic1 keyEnumerator];
    id key = nil;
    while (key = [enumerator nextObject]) {
        NSLog(@"%@ = %@",key, [dic1 valueForKey:key]);
    }
    NSEnumerator *enumerator2 = [dic1 objectEnumerator];
    NSLog(@"objectEnumerator{%@}",enumerator2);
    id val = nil;
    while (val = [enumerator2 nextObject]) {
        NSLog(@"%@ = %@", [dic1 objectForKey:val], val);
    }
}

#pragma mark - 可变字典
void test4(){
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                @"1",@"a",
                                @"2",@"b",
                                @"3",@"c",
                                nil];
    [dic removeObjectForKey:@"a"];
    NSLog(@"%@",dic);
    
    [dic addEntriesFromDictionary:@{@"e":@"7",@"f":@"6"}];
    NSLog(@"%@",dic);
    
    [dic setValue:@"66" forKey:@"c"];
    NSLog(@"%@",dic);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //不管是可变字典还是不可变字典初始化元素后面必须加上nil以表示结束
        test1();
        test2();
        test3();
        test4();
    }
    return 0;
}
