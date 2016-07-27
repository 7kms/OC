//
//  TLImage.m
//  ios-9-touch
//
//  Created by tangliang on 16/7/26.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLImage.h"

@implementation TLImage
-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        UIImage *img = [UIImage imageNamed:@"img-8"];
        [self setBackgroundColor:[UIColor colorWithPatternImage:img ]];
        //self.image = img;
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

#pragma mark UIView 的触摸事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView start touch...");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView moving...");
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView touch end.");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
