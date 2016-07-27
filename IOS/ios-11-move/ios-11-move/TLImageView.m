//
//  TLImageView.m
//  ios-11-move
//
//  Created by 魔方 on 16/7/27.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "TLImageView.h"
#define tImageCount 3

@implementation TLImageView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.image = [self getImage];
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}
#pragma mark 设置控件可以成为第一响应者
-(BOOL)canBecomeFirstResponder{
    return YES;
}
#pragma mark 运动开始
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
//这里只处理摇晃事件
    if(motion == UIEventSubtypeMotionShake){
        self.image = [self getImage];
    }

}
#pragma mark 运动结束
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion ended");
}
#pragma mark 随机取得图片
-(UIImage *)getImage{
    int index = arc4random()%tImageCount+1;
    NSLog(@"image index %i",index);
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"img-%i",index]];
    return image;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
