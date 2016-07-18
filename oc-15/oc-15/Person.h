//
//  Person.h
//  oc-15
//
//  Created by tangliang on 16/7/18.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Account;
@interface Person : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,retain) Account *account;


-(Person *)initWithName:(NSString *)name;
+(Person *)personWithName:(NSString *)name;
-(void)showMessage:(NSString *)infomation;

//自己实现对象比较方法
-(NSComparisonResult)comparePerson:(Person *)person;
@end
