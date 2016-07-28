//
//  AppDelegate.m
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "AppDelegate.h"
#import "KCTabBarViewController.h"
#import "KCWebChatViewController.h"
#import "KCContactViewController.h"

#import "KCFriendViewController.h"
#import "KCQQContactViewController.h"

#import "KCMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _window.backgroundColor =[UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
//    KCTabBarViewController *tabBarController=[[KCTabBarViewController alloc]init];
//    
//    KCWebChatViewController *webChatController=[[KCWebChatViewController alloc]init];
//    KCContactViewController *contactController=[[KCContactViewController alloc]init];
//    tabBarController.viewControllers=@[webChatController,contactController];
//    //注意默认情况下UITabBarController在加载子视图时是懒加载的，所以这里调用一次contactController，否则在第一次展示时只有第一个控制器tab图标，contactController的tab图标不会显示
//    for (UIViewController *controller in tabBarController.viewControllers) {
//        UIViewController *view= controller.view;
//    }
//    
//    _window.rootViewController=tabBarController;

    //设置全局导航条风格和颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];

//    KCFriendViewController *friendController=[[KCFriendViewController alloc]init];
//    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:friendController];
//    
//    _window.rootViewController=navigationController;
    
    KCMainViewController *mainController=[[KCMainViewController alloc]init];
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:mainController];
    _window.rootViewController=navigationController;
    
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
