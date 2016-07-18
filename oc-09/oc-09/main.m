//
//  main.m
//  oc-09
//
//  Created by tangliang on 16/7/18.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

void TestArr(){
    //NSArray 长度不可变所以初始化的时候就复制,并且最后以nil结尾
    //此外NSArray不能存放c语言的基础类型
    NSObject *obj = [[NSObject alloc] init];
    NSArray *arr1 = [NSArray arrayWithObjects:@"abc",obj,@"cde",@"opg",@25, nil];
    NSLog(@"%zi",arr1.count);
    NSLog(@"%i",[arr1 containsObject:@"cde"]);
    NSLog(@"%@",[arr1 lastObject]);
    NSLog(@"%zi",[arr1 indexOfObject:@"abc"]);
    
    
    for (int i = 0,len = arr1.count; i<len; ++i) {
        NSLog(@"method1:index %i is %@",i,[arr1 objectAtIndex:i]);
    }
    
    for (id obj in arr1) {
        NSLog(@"method2:index %zi is %@",[arr1 indexOfObject:obj],obj);
    }

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TestArr();
    }
    return 0;
}
