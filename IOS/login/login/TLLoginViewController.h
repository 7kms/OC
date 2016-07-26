//
//  TLLoginViewController.h
//  login
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TLMainDelegate;

@interface TLLoginViewController : UIViewController



#pragma mark 定义代理
@property (nonatomic,strong)id<TLMainDelegate> delegate;

@end
