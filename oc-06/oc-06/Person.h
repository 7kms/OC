//
//  Person.h
//  oc-06
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


#pragma mark - 属性
@property (nonatomic,copy) NSString *name;

#pragma mark - 公共方法
#pragma mark 带参数的构造函数

-(Person *)initWithName: (NSString *)name;

#pragma mark 取得一个对象(静态方法)
+(Person *)personWithName:(NSString *)name;

@end
