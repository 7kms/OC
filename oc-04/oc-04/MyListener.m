//
//  MyListener.m
//  oc-04
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "MyListener.h"
#import "KCButton.h"

@implementation MyListener
-(void)onClick:(KCButton *)button{
    
    NSLog(@"Invoke MyListener's onClick method.The button is:%@.",button);
}

@end
