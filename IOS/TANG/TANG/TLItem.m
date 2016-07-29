//
//  TLItem.m
//  TANG
//
//  Created by 魔方 on 16/7/29.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "TLItem.h"


@implementation TLItem
-(TLItem *)initWithTitle:(NSString *)title andDes:(NSString *)detail andCode:(int)code{
    self = [super init];
    if(self){
        self.title = title;
        self.detail = detail;
        self.code = code;
    }
    return self;
}

+(TLItem *)initWithTitle:(NSString *)title andDes:(NSString *)detail andCode:(int)code{
    TLItem *item = [[self alloc] initWithTitle:title andDes:detail andCode:code];
    return  item;
}
@end
