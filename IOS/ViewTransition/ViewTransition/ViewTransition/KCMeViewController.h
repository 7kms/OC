//
//  KCMeViewController.h
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCMeViewController : UIViewController

#pragma mark 需要传递的属性参数（很多时候它是一个数据模型）
@property (nonatomic,copy) NSString *userInfo;

@end
