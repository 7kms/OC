//
//  main.m
//  oc-11
//
//  Created by 魔方 on 16/7/18.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>



#pragma mark - 字符串


void Test1(){
    char *str1 = "C string";//这是c语言创建的字符串
    NSString *str2 = @"OC string";//oc 字符串需要加@ ，并且这种方式创建的对象不需要自己释放内存
    //下面创建的方法都应该释放内存
    NSString *str3 = [[NSString alloc] init];
    str3 = @"OC string";
    NSString *str4 = [[NSString alloc] initWithString:@"Objective-c string"];
    NSString *str5 = [[NSString alloc] initWithFormat:@"age is %i,height is %.2f",19,1.725f];
    //c语言的字符串转换为oc的字符串
    NSString *str6= [[NSString alloc] initWithUTF8String:"C string"];
    
    
    
    ///以上方法都有对应静态方法（一般以string开头）,不需要管理内存（系统静态方法一般都是自动释放）
    NSString *str7 = [NSString stringWithString:@"objective-c string"];
     NSLog(@"str1= %@",[NSString stringWithUTF8String:str1]);
    NSLog(str2,nil);
    NSLog(str3,nil);
    NSLog(str4,nil);
    NSLog(str5,nil);
    NSLog(str6,nil);
    NSLog(str7,nil);
    
}

void test2(){
    NSLog(@"\"Hello world!\" to upper is %@",[@"Hello world!" uppercaseString]);
    NSLog(@"\"Hello world!\" to lowwer is %@",[@"Hello world!" lowercaseString]);
    
    //首字母大写，其他字母小写
    NSLog(@"\"Hello world!\" to capitalize is %@",[@"Hello world!" capitalizedString]);
    
    BOOL result= [@"abc" isEqualToString:@"aBc"];
    NSLog(@"%i",result);
    
    
    
    //如果是[@"abc" caseInsensitiveCompare:@"aBc"]则忽略大小写比较
    NSComparisonResult result2= [@"abc" compare:@"aBc"];
    if(result2 == NSOrderedAscending){
        NSLog(@"left<right.");
    }else if(result2 == NSOrderedDescending){
        NSLog(@"left>right.");
    }else if(result2 == NSOrderedSame){
        NSLog(@"left=right.");
    }
}

void test3(){
    
    NSLog(@"has prefix ab? %i",[@"abcdef" hasPrefix:@"ab"]);
    //结果：has prefix ab? 1
    NSLog(@"has suffix ab? %i",[@"abcdef" hasSuffix:@"ef"]);
    //结果：has suffix ab? 1
    NSRange range=[@"abcdefabcdef" rangeOfString:@"cde"];//注意如果遇到cde则不再往后面搜索,如果从后面搜索或其他搜索方式可以设置第二个options参数
    if(range.location == NSNotFound){
        NSLog(@"not found.");
    }else{
        NSLog(@"range is %@",NSStringFromRange(range));
    }
}
#pragma mark 字符串分割
void test4(){
    NSLog(@"%@",[@"abcdef" substringFromIndex:3]);
    NSLog(@"%@",[@"abcdef" substringToIndex:3]);
    NSLog(@"%@",[@"abcdef" substringWithRange:NSMakeRange(2, 3)]);
    NSString *str1 = @"12.abcd.3a";
    NSArray *arr1 = [str1 componentsSeparatedByString:@"."];//字符串分割
    NSLog(@"%@",arr1);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Test1();
        test2();
        test3();
        test4();
        NSLog(@"%li",NSNotFound);
    }
    return 0;
}
