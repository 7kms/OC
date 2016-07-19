//
//  main.m
//  oc-18
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 文件操作

#pragma mark 目录操作
void test1(){
    //文件管理器专门用于文件管理的类
    NSFileManager *manager = [NSFileManager defaultManager];
    //获得当前程序所在目录
    NSString *currentPath = [manager currentDirectoryPath];
    NSLog(@"current path is :%@",currentPath);
    
    //创建目录
    NSString *myPath = @"/Users/mofang/Desktop/myDocument";
    BOOL result = [manager createDirectoryAtPath:myPath withIntermediateDirectories:YES attributes:nil error:nil];
    if(result == NO){
        NSLog(@"Couldn't create directory!");
    }
    //目录重命名，如果需要删除目录只要调用 manager [removeItemAtPath:myPath error:nil]
    NSError *error;
    NSString *newPath = @"/Users/mofang/Desktop/myNewDocument";
    if([manager moveItemAtPath:myPath toPath:newPath error:&error] == NO){
        NSLog(@"Rename directory failed!Error infomation is:%@",error);
    }
    //改变当前目录
//    if([manager changeCurrentDirectoryPath:newPath] == NO){
//     NSLog(@"Change current directory failed!");
//    }
    NSLog(@"current path is : %@", [manager currentDirectoryPath]);
    
    //遍历整个目录
    NSString *path;
    NSDirectoryEnumerator *directoryEnumerator = [manager enumeratorAtPath:@"/Users/mofang/Desktop/test"];
    while (path = [directoryEnumerator nextObject]) {
        NSLog(@"%@",path);
    }
    
    
    //或者这样遍历
    NSArray *paths = [manager contentsOfDirectoryAtPath:@"/Users/mofang/Desktop/test" error:nil];
    NSObject *p;
    for (p in paths){
        NSLog(@"%@",p);
    }

}
#pragma mark 文件操作
void test2(){
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = @"/Users/mofang/Desktop/test/index.html";
    NSString *filePath2 = @"/Users/mofang/Desktop/test/test.txt";
    NSString *newPath = @"/Users/mofang/Desktop/test/new-test.txt";
    //判断文件是否存在，这个方法也可以判断目录是否存在，这要后面的参数设置为YES
    if([manager fileExistsAtPath:filePath isDirectory:NO]){
        NSLog(@"File exists! ");
    }
    //文件是否可读
    if([manager isReadableFileAtPath:filePath]){
        NSLog(@"File is readable!");
    }
    //判断两个文件是否相等
    if([manager contentsEqualAtPath:filePath andPath:filePath2]){
        NSLog(@"file1 equals file2");
    }else{
        NSLog(@"file1 is not equals file2");
    }
    if([manager moveItemAtPath:filePath toPath:newPath error:nil]){
        NSLog(@"rename file success");
    }else{
         NSLog(@"rename file failed");
    }
    //读取文件属性
    NSDictionary *attributes;
    if((attributes = [manager attributesOfItemAtPath:newPath error:nil]) == nil){
        NSLog(@"Read atributes failed");
    }
    for(NSObject *key in attributes){
        NSLog(@"%@ = %@",key,[attributes objectForKey:key]);
    }
    
    //删除文件
    [manager removeItemAtPath:newPath error:nil];
}
#pragma mark 文件类容操作
void test3(){

    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = @"/Users/mofang/Desktop/test/test.txt";
    //NSData 非结构化字节流对象，有缓冲管理机制，可用于网络传输
    NSData *data = [manager contentsAtPath:filePath];
    NSLog(@"%@",data);//存储的是二进制字节流
    
    
    //NSData 转换为字符串
    NSString *str1 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    
    
    //字符串转化成NSData
    NSString *str2 = @"dapdkapdlkpad";
    NSData *data2 = [str2 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",data2);
    
    //当然一般如果仅仅是简单读取文件内容，直接用户NSString方法即可
    NSString *content=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",content);
}
#pragma mark 细腻度控制文件

void test4(){
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = @"/Users/mofang/Desktop/test/test.txt";
    
    
    //注意这个方法返回类型是instancetype 也就是说对于上面的NSFileHandle 他的返回类型也是NSFileHandle
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    NSData *data = [fileHandle readDataToEndOfFile];//完整读取文件
    NSString *newPath = @"/Users/mofang/Desktop/test/createdbyoc.txt";
    [manager createFileAtPath:newPath contents:nil attributes:nil];
    NSFileHandle *fileHandle2 = [NSFileHandle fileHandleForWritingAtPath:newPath];//以可写方式打开文件
    [fileHandle2 writeData:data];//写入文件类容
    [fileHandle2 closeFile];//关闭文件
    
    
    [fileHandle seekToFileOffset:12];
    NSData *data2 = [fileHandle readDataToEndOfFile];
    
    NSLog(@"data2 = %@", [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding]);
    
    
    [fileHandle seekToFileOffset:1];
    NSData *data3 = [fileHandle readDataOfLength:5];
    NSLog(@"data3=%@", [[NSString alloc] initWithData:data3 encoding:NSUTF8StringEncoding]);
    
    [fileHandle closeFile];

}
#pragma mark 文件路径
void test5(){
    NSString *filePath =  @"/Users/mofang/Desktop/test";
    NSString *filePath2 = @"/Users/mofang/Desktop/test/test.txt";
    
    NSString *path = NSTemporaryDirectory();
    NSLog(@"temporary directory id :%@",path);
    NSString *lastComponent = [filePath lastPathComponent];
    NSLog(@"%@",lastComponent);
    NSLog(@"%@",[filePath stringByDeletingLastPathComponent]);
    NSLog(@"%@",[filePath stringByAppendingPathComponent:@"pictures"]);
    NSLog(@"%@",[filePath2 pathExtension]);
    
    [[filePath pathComponents] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%i = %@",idx,obj);
    }];
}
#pragma mark NSURL
void test6(){
    NSURL *url = [NSURL URLWithString:@"http://mofanghr.com/m/index"];
    NSString *str1 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str1);

}
#pragma mark NSBundle
//程序包，一般用于获取Resource中的资源（当然由于当前并非IOS应用没有程序包，只是表示当前程序运行路径）
//在ios中经常用于读取应用程序中的资源文件，如图片，声音，视屏等

void test7(){
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *currentPath = [manager currentDirectoryPath];
    NSLog(@"current path is : %@",currentPath);
    
    NSString *filePath = [currentPath stringByAppendingPathComponent:@"test.txt"];
    [manager createFileAtPath:filePath contents:[@"hello world" dataUsingEncoding: NSUTF8StringEncoding] attributes:nil];
    //利用NSBundle在程序包所在目录查找对应的文件
    NSBundle *bundle = [NSBundle mainBundle];//主要操作程序包所在目录
    //如果有test.txt则返回路径，否则返回nil
    NSString *path = [bundle pathForResource:@"test" ofType:@"txt"];
    NSLog(@"%@",path);
    
    NSString *path1 = [bundle pathForResource:@"pic" ofType:@"jpg" inDirectory:@"Resources"];
    NSLog(@"%@",path1);
    

}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
        test2();
        test3();
        test4();
        test5();
        test6();
        test7();
    }
    return 0;
}
