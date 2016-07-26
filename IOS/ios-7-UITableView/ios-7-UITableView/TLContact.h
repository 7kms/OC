//
//  TLContact.h
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/22.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLContact : NSObject


#pragma mark 姓名
@property (nonatomic,copy) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;

#pragma mark 手机号码
@property (nonatomic,copy) NSString *phoneNumber;

#pragma mark 带参数的构造函数
-(TLContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber: (NSString *)phoneNumber;
#pragma mark 取得姓名
-(NSString *)getName;

#pragma mark 带参数的静态对象初始化方法
+(TLContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber: (NSString *)phoneNumber;
@end
