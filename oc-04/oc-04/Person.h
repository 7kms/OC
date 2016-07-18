//
//  Person.h
//  oc-04
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimalDelegate.h"

@interface Person : NSObject<AnimalDelegate>

-(void)eat;

@end
