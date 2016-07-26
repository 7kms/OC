//
//  TLContact.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/22.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLContact.h"

@implementation TLContact

-(TLContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber: (NSString *)phoneNumber{
    self = [super init];
    if (self){
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}
#pragma mark 取得姓名
-(NSString *)getName{
    return [NSString stringWithFormat:@"%@  %@",_firstName,_lastName ];
}

#pragma mark 带参数的静态对象初始化方法
+(TLContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber: (NSString *)phoneNumber{
    TLContact *contact = [[TLContact alloc] initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return  contact;
}
@end
