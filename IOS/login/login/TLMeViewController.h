//
//  TLMeViewController.h
//  login
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLMeViewController : UIViewController
#pragma mark 需要传递的参数(很多时候他是一个数据模型)
@property (nonatomic,copy)NSString *userInfo;
@end
