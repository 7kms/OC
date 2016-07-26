//
//  KCLoginViewController.h
//  ViewTransition
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol KCMainDelegate;

@interface KCLoginViewController : UIViewController

#pragma mark 定义代理
@property (nonatomic,strong) id<KCMainDelegate> delegate;

@end
