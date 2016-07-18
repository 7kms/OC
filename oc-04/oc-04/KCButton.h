//
//  KCButton.h
//  oc-04
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KCButton;


//一个协议可以扩展另一个协议，例如KCButtonDelegate扩展了NSObject协议
@protocol KCButtonDelegate <NSObject>


//@required修饰的方法必须实现
@required
-(void)onClick:(KCButton *)button;

//@optional修饰的方法是可选实现
@optional
-(void)onMouseover:(KCButton *)button;
-(void)onMousout:(KCButton *)button;
@end



@interface KCButton : NSObject


//id可以表示任何一个ObjC对象类型，
//类型后面的”<协议名>“用于约束作为这个属性的对象必须实现该协议(注意：使用id定义的对象类型不需要加“*”)；
@property (nonatomic,retain) id<KCButtonDelegate>  delegate;

-(void)click;

@end
