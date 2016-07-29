//
//  AppDelegate.m
//  TANG
//
//  Created by 魔方 on 16/7/28.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "AppDelegate.h"
#import "TLTabBarViewController.h"
#import "TLTableViewController.h"
#import "TLPersonalViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    TLTabBarViewController *tabBarController = [[TLTabBarViewController alloc] init];
    //设置全局导航条风格和颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    TLTableViewController *tableViewController = [[TLTableViewController alloc] init];
    TLPersonalViewController *personalViewController = [[TLPersonalViewController alloc] init];
    //设置图标、标题(tabBarItem是显示在tabBar上的标签)
    tableViewController.tabBarItem.title=@"table";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    tableViewController.tabBarItem.image=[UIImage imageNamed:@"table"];//默认图片
    tableViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"table-selected"];//选中图片
    personalViewController.tabBarItem.title=@"my";
    personalViewController.tabBarItem.image=[UIImage imageNamed:@"personal"];
    personalViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"personal-selected"];
    
    UINavigationController *navTableViewController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    UINavigationController *navPersonalViewController = [[UINavigationController alloc] initWithRootViewController:personalViewController];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:navTableViewController, navPersonalViewController ,nil];

    //[tabBarController setSelectedIndex:1];
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    [navigationController setNavigationBarHidden:YES];
    
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
