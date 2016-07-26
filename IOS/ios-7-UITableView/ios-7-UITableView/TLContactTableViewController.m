//
//  TLContactTableViewController.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/25.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLContactTableViewController.h"
#import "TLContact.h"
#import "TLConcatGroup.h"
#define tSearchbarHeight 44

@interface TLContactTableViewController ()<UISearchBarDelegate>{
    UITableView *_tableview;
    UISearchBar *_searchBar;
    NSMutableArray *_contacts;//联系人模型
    NSMutableArray *_searchContacts;//符合条件的搜索联系人
    BOOL _isSearching;
    
}

@end

@implementation TLContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加收索框
    [self addSearchBar];
    //初始化数据
    [self initData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    if(_isSearching){
        return 1;
    }
    return _contacts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    if(_isSearching){
        return _searchContacts.count;
    }
    TLConcatGroup *group = _contacts[section];
    return group.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TLContact *contact = nil;
    if(_isSearching){
        contact = _searchContacts[indexPath.row];
    }else{
        TLConcatGroup *group = _contacts[indexPath.section];
        contact = group.contacts[indexPath.row];
    }
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    //首先根据标识去缓存池取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果缓存池没有取到,则重新创建并放到缓存池中
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    
    return cell;
}
#pragma mark 代理方法
#pragma mark 设置分组标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    TLConcatGroup *group = _contacts[section];
    return group.name;
}
#pragma mark 搜索框代理
#pragma mark 取消搜索
-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    _isSearching = NO;
    _searchBar.text = @"";
    [self.tableView reloadData];
}

#pragma mark 输入搜索关键字
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText{
    if([_searchBar.text isEqual:@""]){
        _isSearching = NO;
        [self.tableView reloadData];
    }
    [self searchDataWithKeyWord:_searchBar.text];
}
#pragma mark 点击虚拟键盘上的搜索时
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    [self searchDataWithKeyWord:_searchBar.text];
    [_searchBar resignFirstResponder];//放弃第一响应者对象,关闭虚拟键盘
}
#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark 加载数据
-(void)initData{
    
    _contacts=[[NSMutableArray alloc]init];
    TLContact *contact1=[TLContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    TLContact *contact2=[TLContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    TLConcatGroup *group1=[TLConcatGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];
    
    
    
    TLContact *contact3=[TLContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    TLContact *contact4=[TLContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    TLContact *contact5=[TLContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    TLConcatGroup *group2=[TLConcatGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];
    
    
    
    TLContact *contact6=[TLContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    TLContact *contact7=[TLContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];
    
    TLConcatGroup *group3=[TLConcatGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];
    
    
    TLContact *contact8=[TLContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    TLContact *contact9=[TLContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    TLContact *contact10=[TLContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    TLContact *contact11=[TLContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    TLContact *contact12=[TLContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    TLConcatGroup *group4=[TLConcatGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];
    
    
    TLContact *contact13=[TLContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    TLContact *contact14=[TLContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    TLContact *contact15=[TLContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    TLConcatGroup *group5=[TLConcatGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
    
}
#pragma mark 搜索形成新数据
-(void)searchDataWithKeyWord:(NSString *)keyWord{
    _isSearching  = YES;
    _searchContacts = [NSMutableArray array];
    [_contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
        TLConcatGroup *group = obj;
        [group.contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            TLContact *contact = obj;
            if([contact.firstName.uppercaseString containsString:keyWord.uppercaseString] || [contact.lastName.uppercaseString containsString:keyWord.uppercaseString] || [contact.phoneNumber containsString:keyWord]){
                [_searchContacts addObject:contact];
            }
        }];
    }];
    //刷新表格
    [self.tableView reloadData];
}
#pragma mark 添加搜索栏
-(void) addSearchBar{
    CGRect searchBarRect = CGRectMake(0, 0, self.view.frame.size.width, tSearchbarHeight);
    _searchBar = [[UISearchBar alloc] initWithFrame:searchBarRect];
    _searchBar.placeholder = @"Please input key word...";
    _searchBar.showsCancelButton = YES;
    //添加搜索框到页眉位置
    _searchBar.delegate = self;
    self.tableView.tableHeaderView = _searchBar;
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
