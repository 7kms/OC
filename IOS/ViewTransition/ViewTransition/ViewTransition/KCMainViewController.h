//
//  KCMainViewController.h
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark 定义一个协议用于参数传递
@protocol KCMainDelegate
-(void)showUserInfoWithUserName:(NSString *)userName;
@end

@interface KCMainViewController : UIViewController

@end
