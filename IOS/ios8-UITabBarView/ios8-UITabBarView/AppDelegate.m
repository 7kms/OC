//
//  AppDelegate.m
//  ios8-UITabBarView
//
//  Created by tangliang on 16/7/25.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "AppDelegate.h"
#import "TLTabBarViewController.h"
#import "TLWebChatViewController.h"
#import "TLContactViewController.h"


#import "TLFriendViewController.h"
#import "TLQQContactViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    TLTabBarViewController *tabBarController = [[TLTabBarViewController alloc] init];
//    TLWebChatViewController *webChatController = [[TLWebChatViewController alloc] init];
//     TLContactViewController *contactController = [[TLContactViewController alloc] init];
//    tabBarController.viewControllers = @[webChatController,contactController];
//    //注意默认情况下UITabBarController会一次性初始化所以子控件.但是默认只加载第一个控制器视图,其他视图控制器只初始化默认不会加载,为了能够将其他子控制器也正常显示在TabBar中我们访问了每个子视图控制器的视图,以便调用其视图加载方法(viewDidLoad);当然,既然会调用子视图的初始化方法,当然也可以将视图控制器的tabBarItem属性设置放到init方法中设置.如此就不需要再次遍历其视图属性了
//    for(UIViewController *controller in tabBarController.viewControllers){
//        UIViewController *view = controller.view;
//    }
//    _window.rootViewController = tabBarController;
//    [_window makeKeyAndVisible];
    
    
    
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
     _window.backgroundColor =[UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
    //设置全局导航条风格和颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:249/255.0 green:180/255.0 blue:237/255.0 alpha:1]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    TLFriendViewController *friendController = [[TLFriendViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:friendController];
    _window.rootViewController = navigationController;
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
