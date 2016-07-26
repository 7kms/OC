//
//  KCSettingsTableViewController.m
//  NavigationControllerByStoryboard
//
//  Created by Kenshin Cui on 14-3-15.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCSettingsTableViewController.h"

@interface KCSettingsTableViewController ()

@end

@implementation KCSettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

#pragma mark - 导航
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //源视图控制器
    UITableViewController *settingController=segue.sourceViewController;
    //目标视图控制器
    UITableViewController *tableViewController=segue.destinationViewController;
    NSLog(@"sourceController:%@,destinationController:%@",settingController.navigationItem.title,tableViewController.navigationItem.title);
}


- (IBAction)toGeneral:(id)sender {
    [self performSegueWithIdentifier:@"GeneralSegue" sender:self];
}

- (IBAction)toSounds:(id)sender {
    [self performSegueWithIdentifier:@"SoundsSegue" sender:self];
}

@end
