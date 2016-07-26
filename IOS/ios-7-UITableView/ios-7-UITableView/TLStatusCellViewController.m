//
//  TLStatusCellViewController.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/23.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLStatusCellViewController.h"
#import "TLStatus.h"
#import "TLStatusTableViewCell.h"

@interface TLStatusCellViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_status;
    NSMutableArray *_statusCells;//储存cell,用于计算高度
}

@end

@implementation TLStatusCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据
    [self initData];
    // 创建一个分组样式的UITableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView.backgroundColor = [UIColor redColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 加载数据
-(void)initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StatusInfo" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _status = [[NSMutableArray alloc] init];
    _statusCells = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject: [TLStatus statusWithDictionary:obj]];
        TLStatusTableViewCell *cell = [[TLStatusTableViewCell alloc] init];
        [_statusCells addObject:cell];
    }];
}
#pragma mark 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _status.count;
}
#pragma mark 返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"返回单元格%li行",(long)indexPath.row);
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    TLStatusTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[TLStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博,以便重新布局
    TLStatus *status = _status[indexPath.row];
    cell.status = status;
    return cell;
    
}
#pragma mark 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"重新设置单元格高度%li行",(long)indexPath.row);
    TLStatusTableViewCell *cell = _statusCells[indexPath.row];
    cell.status = _status[indexPath.row];
    
    return cell.height;
}



#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
