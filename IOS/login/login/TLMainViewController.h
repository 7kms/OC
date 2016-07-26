//
//  TLMainViewController.h
//  login
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark 定义一个协议用于参数传递

@protocol TLMainDelegate

-(void)showUserInfoWithUserName:(NSString *)userName;

@end



@interface TLMainViewController : UIViewController

@end
