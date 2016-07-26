//
//  TLConcatGroup.h
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/22.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLConcatGroup : NSObject

#pragma mark 组名
@property (nonatomic,copy) NSString *name;

#pragma mark 分组描述
@property (nonatomic,copy) NSString *detail;

#pragma mark 联系人
@property (nonatomic,strong) NSMutableArray *contacts;

#pragma mark 带参数个构造函数
-(TLConcatGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

#pragma mark 静态初始化方法
+(TLConcatGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

@end
