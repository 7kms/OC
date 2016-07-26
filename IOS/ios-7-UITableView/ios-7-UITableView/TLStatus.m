//
//  TLStatus.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/23.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLStatus.h"

@implementation TLStatus

#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
-(TLStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self = [super init]){
        self.Id=[dic[@"Id"] longLongValue];
        self.profileImageUrl=dic[@"profileImageUrl"];
        self.userName=[dic valueForKey:@"userName"];
        self.mbtype=dic[@"mbtype"];
        self.createdAt=dic[@"createdAt"];
        self.source=dic[@"source"];
        self.text=dic[@"text"];
    }
    return self;

}

#pragma mark 初始化微博对象（静态方法）
+(TLStatus *)statusWithDictionary:(NSDictionary *)dic{
    TLStatus *status = [[TLStatus alloc] initWithDictionary:dic];
    return status;
}

-(NSString *)source{
    return [NSString stringWithFormat:@"来自 %@",_source];
}

@end
