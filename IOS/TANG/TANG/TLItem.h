//
//  TLItem.h
//  TANG
//
//  Created by 魔方 on 16/7/29.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLItem : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *detail;
@property (nonatomic,assign) int code;
-(TLItem *)initWithTitle:(NSString *)title andDes:(NSString *)detail andCode:(int)code;


+(TLItem *)initWithTitle:(NSString *)title andDes:(NSString *)detail andCode:(int)code;
@end
