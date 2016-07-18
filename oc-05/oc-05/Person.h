//
//  Person.h
//  oc-05
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;
@interface Person : NSObject{
    
    @protected
    Car *_car;

}
#pragma mark -属性
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;


#pragma mark -公共方法
#pragma mark Car属性的set方法
-(void) setCar:(Car *)car;
#pragma mark Car属性的get方法
-(Car *)car;


@end
