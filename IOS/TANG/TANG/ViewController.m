//
//  ViewController.m
//  TANG
//
//  Created by 魔方 on 16/7/28.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ViewController.h"
//定义一个宏
#define PrintRect(frame) NSLog(@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testBoundsAndFrame];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)testBoundsAndFrame{
    NSLog(@"[[UIScreen mainScreen] bounds]");
    PrintRect([[UIScreen mainScreen] bounds]);
    NSLog(@"[[UIScreen mainScreen] applicationFrame]");
    PrintRect([[UIScreen mainScreen] applicationFrame]);
}

@end
