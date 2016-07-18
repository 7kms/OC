//
//  AnimalDelegate.h
//  oc-04
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

//定义一个协议
@protocol AnimalDelegate <NSObject>


//必须实现的方法
@required
-(void)eat;

//可选实现的方法
@optional
-(void)run;
-(void)say;
-(void)sleep;

@end