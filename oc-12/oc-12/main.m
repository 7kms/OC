//
//  main.m
//  oc-12
//
//  Created by 魔方 on 16/7/18.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 文件操作


void test1(){
    //读取文件类容
    NSString *path = @"/Users/mofang/Desktop/70110id_rsa.rsa";
     NSString *path2 = @"/Users/mofang/Desktop/test/test.txt";
    NSString *str1 = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"str1 is %@",str1);
    
    
    
    
    //上面我们看到了读取文件，但并没有处理错误,当然在ObjC中可以@try @catch @finnally但通常我们并不那么做
    //由于我们的test.txt中有中文，所以使用下面的编码读取会报错，下面的代码演示了错误获取的过程
    NSError *error;
    NSString *str2 = [NSString stringWithContentsOfFile:path2 encoding:kCFStringEncodingGB_18030_2000 error:&error];//注意这句话中的error变量是**error，就是指针的指针那就是指针的地址，由于error就是一个指针此处也就是error的地址&error，具体原因见下面补充
    
    if(error){
        NSLog(@"read error, the error is %@",error);
    }else{
        NSLog(@"read success,the file content is %@",str2);
    }
    
    
    
    //读取文件内容还有一种方式就是利用URl，它除了可以读取本地文件还可以读取网络文件
    //NSURL *url=[NSURL URLWithString:@"file:///Users/mofang/Desktop/test.txt"];
    NSURL *url=[NSURL URLWithString:@"http://www.mofanghr.com/m/index"];
    NSString *str3=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"str3 is %@",str3);
    
    [str3 writeToFile:@"/Users/mofang/Desktop/test/index.html" atomically:YES encoding:NSUTF8StringEncoding error:nil];

}
#pragma mark - 文件写入
void test2(){
    NSString *path1 = @"/Users/mofang/Desktop/test/test2.txt";
    
    NSError *error1;
    NSString *str1 = @"hello world,时间";
    [str1 writeToFile:path1 atomically:YES encoding:NSUTF8StringEncoding error:&error1];
    if(error1){
        //调用localizedDescription 是只打印关键错误信息
        NSLog(@"write fail,the error is %@", [error1 localizedDescription]);
    }else{
        NSLog(@"write success!");
    }
}
#pragma mark - 路径操作

void test3(){
    NSMutableArray *marray = [NSMutableArray array];//可变数组
    [marray addObject:@"Users"];
    [marray addObject:@"mofang"];
    [marray addObject:@"Desktop"];
    [marray addObject:@"test"];
    NSString *path = [NSString pathWithComponents:marray];
    //字符串拼接成路径
    NSLog(@"%@",path);
    NSLog(@"%@", [path pathComponents]);
    NSLog(@"%i", [path isAbsolutePath]);
    NSLog(@"%@", [path lastPathComponent]);
    //删除最后一个目录，path本身没有被修改，只是返回一个新字符串
    NSLog(@"%@", [path stringByDeletingLastPathComponent]);
    //路径拼接
    NSLog(@"%@",[path stringByAppendingPathComponent:@"Documents"]);
    

}
#pragma mark - 扩展名操作
void test4(){
    NSString *path = @"Users/mofang/Desktop/test/test.txt";
    //取得扩展名，oc中扩展名不包括“.”
    NSLog(@"%@",[path pathExtension]);
    //删除扩展名，包括“.”
    NSLog(@"%@", [path stringByDeletingPathExtension]);
    //添加扩展名
    NSLog(@"%@", [@"Users/mofang/Desktop/test/test" stringByAppendingPathExtension:@"mp3"]);

}

#pragma mark - 可变字符串
void test5(){
    /*可变字符串，注意NSMutableString是NSString子类*/
    //注意虽然initWithCapacity分配字符串大小，但是不是绝对的不可以超过此范围，声明此变量对性能有好处
    NSMutableString *str1 = [[NSMutableString alloc] initWithCapacity:10];
    [str1 setString:@"hello"];
    NSLog(@"%@",str1);
    //追加字符串
    [str1 appendString:@" world!"];
    NSLog(@"%@",str1);
    
    [str1 appendFormat:@"\nmy name is %@, my age is %i,dear , I wait you",@"honey",12];
    NSLog(@"%@",str1);
    //替换字符串
    NSRange range = [str1 rangeOfString:@"dear"];
    [str1 replaceCharactersInRange:range withString:@"honey"];
    NSLog(@"%@",str1);
    //插入字符串
    [str1 insertString:@"xcode is amizing" atIndex: str1.length];
    NSLog(@"%@",str1);
    //删除指定范围的字符串
    [str1 deleteCharactersInRange:[str1 rangeOfString: @"I wait you"]];
    NSLog(@"%@",str1);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
        test2();
        test3();
        test4();
        test5();
    }
    return 0;
}
