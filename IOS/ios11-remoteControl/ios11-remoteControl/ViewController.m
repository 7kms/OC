//
//  ViewController.m
//  ios11-remoteControl
//
//  Created by 魔方 on 16/7/27.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIButton *_playButton;
    BOOL _isPlaying;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [self initLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)canBecomeFirstResponder{
    return NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://stream.jewishmusicstream.com:8000"]];
    
    //[_player play];
    //_isPlaying=true;
}

#pragma mark 远程控制事件
-(void)remoteControlReceivedWithEvent:(UIEvent *)event{
    NSLog(@"%i,%i",event.type,event.subtype);
    if(event.type==UIEventTypeRemoteControl){
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlPlay:
                [_player play];
                _isPlaying=true;
                break;
            case UIEventSubtypeRemoteControlTogglePlayPause:
                if (_isPlaying) {
                    [_player pause];
                }else{
                    [_player play];
                }
                _isPlaying=!_isPlaying;
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                NSLog(@"Next...");
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                NSLog(@"Previous...");
                break;
            case UIEventSubtypeRemoteControlBeginSeekingForward:
                NSLog(@"Begin seek forward...");
                break;
            case UIEventSubtypeRemoteControlEndSeekingForward:
                NSLog(@"End seek forward...");
                break;
            case UIEventSubtypeRemoteControlBeginSeekingBackward:
                NSLog(@"Begin seek backward...");
                break;
            case UIEventSubtypeRemoteControlEndSeekingBackward:
                NSLog(@"End seek backward...");
                break;
            default:
                break;
        }
        [self changeUIState];
    }
}


#pragma mark 界面布局
-(void)initLayout{
    //专辑封面
    UIImage *image=[UIImage imageNamed:@"wxl.jpg"];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    imageView.image=image;
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    //播放控制面板
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 480, 320, 88)];
    view.backgroundColor=[UIColor lightGrayColor];
    view.alpha=0.9;
    [self.view addSubview:view];
    
    //添加播放按钮
    _playButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _playButton.bounds=CGRectMake(0, 0, 50, 50);
    _playButton.center=CGPointMake(view.frame.size.width/2, view.frame.size.height/2);
    [self changeUIState];
    [_playButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_playButton];
}

#pragma mark 界面状态
-(void)changeUIState{
    if(_isPlaying){
        [_playButton setImage:[UIImage imageNamed:@"playing_btn_pause_n.png"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"playing_btn_pause_h.png"] forState:UIControlStateHighlighted];
    }else{
        [_playButton setImage:[UIImage imageNamed:@"playing_btn_play_n.png"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"playing_btn_play_h.png"] forState:UIControlStateHighlighted];
    }
}

-(void)btnClick:(UIButton *)btn{
    if (_isPlaying) {
        [_player pause];
    }else{
        [_player play];
    }
    _isPlaying=!_isPlaying;
    [self changeUIState];
}

@end



