//
//  AppDelegate.m
//  IOS
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//程序启动之后执行，只有在第一次程序启动后才执行，以后不再执行；
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor yellowColor];
//    [self.window makeKeyAndVisible];
    NSLog(@"程序已经启动。。。");
    return YES;
}

//程序将要被激活时（获得焦点）执行，程序激活用户才能操作；
- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSLog(@"程序将要失去焦点！");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


//程序进入后台后执行，注意进入后台时会先失去焦点再进入后台；
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"程序已经进入后台");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//程序将要进入前台时执行；
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"程序将要进入前台");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


//程序被激活（获得焦点）后执行，注意程序被激活时会先进入前台再被激活；
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"程序已经获得焦点！");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


//程序在终止时执行，包括正常终止或异常终止，例如说一个应用程序在后太运行（例如音乐播放软件、社交软件等）占用太多内存这时会意外终止调用此方法
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"程序将要终止！");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
