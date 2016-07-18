//
//  Person.m
//  oc-05
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void) setCar:(Car *)car{
    if(_car != car){//首先判断要赋值的变量和当前成员变量是不是同一个变量
        [_car release];//释放之前的对象
        _car = [car retain];//赋值时重新retain
    }
}

-(Car *)car{
    //return self.car;
    return  _car;
}


//重写dealloc方法,在这个方法中通常进行对象释放操作
-(void)dealloc{
    NSLog(@"Invoke Person{%@} dealloc method.",_name);
    
    [_car release];//在此释放对象，即使没有赋值过由于空指针也不会出错
    
    //注意最后一定要调用父类的dealloc方法
    //（两个目的：一是父类可能有其他引用对象需要释放；
    //二是：当前对象真正的释放操作是在super的dealloc中完成的）
    [super dealloc];
}

@end
