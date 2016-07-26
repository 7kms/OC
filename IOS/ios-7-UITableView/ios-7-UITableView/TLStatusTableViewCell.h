//
//  TLStatusTableViewCell.h
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/23.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLStatus.h"
@interface TLStatusTableViewCell : UITableViewCell
#pragma mark 微博对象
@property (nonatomic,strong) TLStatus *status;
#pragma mark 单元格高度
@property (nonatomic,assign) CGFloat height;
@end
