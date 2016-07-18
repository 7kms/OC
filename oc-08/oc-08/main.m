//
//  main.m
//  oc-08
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *date = [NSDate date];
        NSLog(@"data={%@}",date);
        
        NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:100];
        NSLog(@"data={%@}",date2);

        NSDate *date3=[NSDate distantFuture];//随机获取一个将来的日期
        NSLog(@"%@",date3); //结果：4001-01-01 00:00:00 +0000
        
        NSTimeInterval time = [date2 timeIntervalSinceDate:date];
        NSLog(@"%f",time);
        
        
        //日期格式化
        NSDateFormatter *formater1=[[NSDateFormatter alloc] init];
        formater1.dateFormat=@"yy-MM-dd HH:mm:ss";
        NSString *datestr1=[formater1 stringFromDate:date];
        NSLog(@"%@",datestr1);
        
        //字符串转化为日期
        NSDate *date6=[formater1 dateFromString:@"14-02-14 11:07:16"];
        NSLog(@"%@",date6);
        
        
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        
        NSInteger interval = [zone secondsFromGMTForDate: date];
        
        NSDate *localDate = [date  dateByAddingTimeInterval: interval];
    
        NSLog(@"正确当前时间 localDate = %@",localDate);
    }
    return 0;
}