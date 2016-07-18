//
//  KCButton.m
//  oc-04
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "KCButton.h"

@implementation KCButton
-(void)click{
    NSLog(@"Invoke KCButton's click method.");
    //判断_delegate实例是否实现了onClick:方法（注意方法名是"onClick:",后面有个:）
    //避免未实现ButtonDelegate的类也作为KCButton的监听
    
    
    //使用respondsToSelector方法可以判断一个对象是否实现了某个方法（需要注意方法名不是”onClick”而是“onClick:”，冒号也是方法名的一部分
    if([_delegate respondsToSelector:@selector(onClick:)]){
        [_delegate onClick:self];
    }}

@end
