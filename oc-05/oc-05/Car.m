//
//  Car.m
//  oc-05
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "Car.h"

@implementation Car

#pragma mark - 公共方法
#pragma mark 运行方法
-(void) run{
    NSLog(@"Car{%@},is running",self.no);
}
#pragma mark - 覆盖方法
#pragma mark 重写dealloc方法
-(void) dealloc{
    NSLog(@"Invoke Car {%@} dealloc method",self.no);
    [super dealloc];
}
@end
