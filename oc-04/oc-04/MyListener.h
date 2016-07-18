//
//  MyListener.h
//  oc-04
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KCButton;
@protocol KCButtonDelegate;



@interface MyListener : NSObject<KCButtonDelegate>

-(void) onClick:(KCButton *)button;

@end
