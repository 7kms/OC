//
//  TLConcatGroup.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/22.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLConcatGroup.h"

@implementation TLConcatGroup

#pragma mark 带参数个构造函数
-(TLConcatGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    self = [super init];
    if(self){
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

#pragma mark 静态初始化方法
+(TLConcatGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    TLConcatGroup *group = [[TLConcatGroup alloc] initWithName:name andDetail:detail andContacts:contacts];
    return group;
}

@end
