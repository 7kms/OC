//
//  TLContactTableViewControllerWithUISearchDisplayController.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/25.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLContactTableViewControllerWithUISearchDisplayController.h"
#import "TLContact.h"
#import "TLConcatGroup.h"
#define tSearchbarHeight 44


@interface TLContactTableViewControllerWithUISearchDisplayController ()<UISearchBarDelegate,UISearchDisplayDelegate>{
    UITableView *_tableview;
    UISearchBar *_searchBar;
    UISearchDisplayController *_searchDisplayController;
    NSMutableArray *_contacts;//联系人模型
    NSMutableArray *_searchContacts;//符合条件的搜索联系人
    //BOOL _isSearching;
}

@end

@implementation TLContactTableViewControllerWithUISearchDisplayController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加收索框
    [self addSearchBar];
    //初始化数据
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    //如果当前是UISearchDisplayController内部的tableView则不分组
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    
    return _contacts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return _searchContacts.count;
    }
    TLConcatGroup *group = _contacts[section];
    return group.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TLContact *contact = nil;
    TLConcatGroup *group = _contacts[indexPath.section];
    
    if(tableView == self.searchDisplayController.searchResultsTableView){
        contact = _searchContacts[indexPath.row];
    }else{
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
    if (tableView==self.searchDisplayController.searchResultsTableView) {
        return @"搜索结果";
    }
    
    TLConcatGroup *group = _contacts[section];
    return group.name;
}
#pragma mark 选中之前
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_searchBar resignFirstResponder];//退出键盘
    return indexPath;
}
#pragma mark 搜索框代理
//#pragma mark 取消搜索
//-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
//    
//    _searchBar.text = @"";
//    [self.tableView reloadData];
//}
//
//#pragma mark 输入搜索关键字
//-(void) searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText{
//    if([_searchBar.text isEqual:@""]){
//        
//        [self.tableView reloadData];
//    }
//    [self searchDataWithKeyWord:_searchBar.text];
//}
//#pragma mark 点击虚拟键盘上的搜索时
//-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    
//    [self searchDataWithKeyWord:_searchBar.text];
//    [_searchBar resignFirstResponder];//放弃第一响应者对象,关闭虚拟键盘
//}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self searchDataWithKeyWord:searchString];
    return YES;
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
    //[self.tableView reloadData];
}
#pragma mark 添加搜索栏
-(void) addSearchBar{

    _searchBar = [[UISearchBar alloc] init];
    [_searchBar sizeToFit];//大小自适应容器
    _searchBar.placeholder = @"please input key word...";
    _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _searchBar.showsCancelButton = YES;//显示取消按钮
    //添加搜索框到页眉位置
    _searchBar.delegate = self;
    self.tableView.tableHeaderView = _searchBar;
    
    _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _searchDisplayController.delegate = self;
    _searchDisplayController.searchResultsDataSource = self;
    _searchDisplayController.searchResultsDelegate = self;
    [_searchDisplayController setActive:NO animated:YES];
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
