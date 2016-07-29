//
//  ItemDetailViewController.h
//  TANG
//
//  Created by 魔方 on 16/7/29.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailViewController : UIViewController

@property (nonatomic,strong) NSString *dynamictitle;
@property (nonatomic,strong) NSString *detail;

+(ItemDetailViewController *)initWithTitle:(NSString *)title andDescription:(NSString *)detail;
-(ItemDetailViewController *)initWithTitle:(NSString *)title andDescription:(NSString *)detail;
@end
