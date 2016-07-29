//
//  TLTableViewController.m
//  TANG
//
//  Created by 魔方 on 16/7/29.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLItem.h"
#import "ItemDetailViewController.h"
@interface TLTableViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>{
    UITableView *_tableView;
    UISearchBar *_searchBar;
    //UISearchController *_searchController;
    UISearchDisplayController *_searchDisplayController;
    NSMutableArray *_itemArr;//item模型
    NSMutableArray *_searchArr;//符合搜索条件的item
}

@end

@implementation TLTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController setNavigationBarHidden:YES];
     self.navigationItem.title = @"overview";
    [self initData];
    [self addSearchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - initData

-(void)initData{
    //利用NSBundle在程序包所在目录查找对应的文件
 //   NSBundle *bundle=[NSBundle mainBundle];//主要操作程序包所在目录
    //如果有test.txt则返回路径，否则返回nil
//    NSString *path=[bundle pathForResource:@"test" ofType:@"txt"];//也可以写成：[bundle pathForResource:@"instructions.txt" ofType:nil];
//    NSLog(@"%@",path);
//
//    NSLog(@"%@",[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]);

    NSBundle *bundle2 = [NSBundle mainBundle];
    NSString *path = [bundle2 pathForResource:@"progress" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    _itemArr = [[NSMutableArray alloc] init];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TLItem *item = [TLItem initWithTitle:obj[@"title"] andDes:obj[@"detail"] andCode:(int)obj[@"code"]];
        [_itemArr addObject:item];
    }];
}
#pragma mark - 添加搜索栏
-(void)addSearchBar{
    _searchBar = [[UISearchBar alloc] init];
    [_searchBar sizeToFit];
    _searchBar.placeholder = @"input some word...";
    _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    //添加搜索框到页眉位置
    self.tableView.tableHeaderView = _searchBar;
    
    _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _searchDisplayController.delegate = self;
    _searchDisplayController.searchResultsDataSource = self;
    _searchDisplayController.searchResultsDelegate = self;
    [_searchDisplayController setActive:NO animated:YES];
}

#pragma mark 选中之前
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_searchBar resignFirstResponder];//退出键盘
    return indexPath;
}
#pragma mark 选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TLItem *item = [_itemArr objectAtIndex: indexPath.row];
    ItemDetailViewController *ITC = [ItemDetailViewController initWithTitle:[item valueForKey:@"title" ] andDescription:[item valueForKey:@"detail" ]];
    [self.navigationController pushViewController:ITC animated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return  _searchArr.count;
    }
    return _itemArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TLItem *item = nil;
    if(tableView == self.searchDisplayController.searchResultsTableView){
        item = [_searchArr objectAtIndex:indexPath.row];
    }else{
        item = [_itemArr objectAtIndex:indexPath.row];
    }
    static NSString *cellIdentifier = @"normalItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [item valueForKey:@"title"];
    cell.detailTextLabel.text = [item valueForKey:@"detail"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark 代理方法
#pragma mark 设置分组标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return @"搜索结果";
    }
    return  @"项目";
}

#pragma mark UISearchDisplayController代理方法
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self searchDataWithKeyWord:searchString];
    return YES;
}

#pragma mark 搜索形成新数据
-(void)searchDataWithKeyWord:(NSString *)keyWord{
    _searchArr = [NSMutableArray array];
    [_itemArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TLItem *item = obj;
        if([[[item valueForKey:@"title"] uppercaseString] containsString:keyWord.uppercaseString] || [[[item valueForKey:@"detail"] uppercaseString] containsString:keyWord.uppercaseString]){
            [_searchArr addObject:item];
        }
        
    }];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
