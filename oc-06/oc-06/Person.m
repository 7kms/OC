//
//  Person.m
//  oc-06
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark 带参数的构造函数
-(Person *)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        self.name = name;
    }
    return self;
}
#pragma mark 取得一个对象(静态方法)
+(Person *)personWithName:(NSString *)name{
    Person *p = [[[Person alloc] initWithName:name] autorelease];//这里调用了autorelease
    return p;
}

#pragma mark 重写dealloc方法

-(void)dealloc{
    NSLog(@"Invoke Person{%@} dealloc method",self.name);
    [super dealloc];
}
@end
