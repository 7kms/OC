//
//  ViewController.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/22.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "ViewController.h"
#import "TLContact.h"
#import "TLConcatGroup.h"



#define tContactToolbarHeight 44
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    UITableView *_tableView;
    UIToolbar *_toolbar;
    NSMutableArray *_contacts;//联系人模型
    NSIndexPath *_selectedIndexPath;//当前选中的组和行
    BOOL _isInsert;//记录是点击了插入还是删除按钮
}

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    
//    //初始化数据
//    [self initData];
//    
//    //创建一个分组样式的UITableView
//    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//   
//    
//    _tableView.contentInset=UIEdgeInsetsMake(tContactToolbarHeight, 0, 0, 0);
//   // 设置数据源，注意必须实现对应的UITableViewDataSource协议
//    _tableView.dataSource = self;
//   // 设置代理
//    _tableView.delegate = self;
//    
//    [self.view addSubview:_tableView];
//    
//    //添加工具栏
//    [self addToolBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 添加工具栏
-(void) addToolBar{
    CGRect frame = self.view.frame;
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, tContactToolbarHeight)];
    _toolbar.backgroundColor = [UIColor redColor];
    [self.view addSubview:_toolbar];
    
    UIBarButtonItem *removeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(remove)];
    UIBarButtonItem *flexibleButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    NSArray *buttonArray = [[NSArray alloc] initWithObjects:removeButton ,flexibleButton,addButton ,nil];
    _toolbar.items = buttonArray;

}

#pragma mark 删除
-(void)remove{
    //直接通过下面的方法设置编辑状态没有动画
    //_tableView.editing=!_tableView.isEditing;
    _isInsert = false;
    [_tableView setEditing:!_tableView.isEditing animated:true];
}

#pragma mark 添加
-(void)add{
    _isInsert = true;
    [_tableView setEditing:!_tableView.isEditing animated:true];
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


#pragma mark 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return _contacts.count;
}
#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%li)行数",(long)section);
    TLConcatGroup *group = _contacts[section];
    return group.contacts.count;
}

#pragma mark返回每行的单元格
//此方法调用很频繁,无论是初始化,上下滚动,刷新都会调用此方法.所有在这里执行的操作一定要注意性能.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    NSLog(@"生成单元格(组：%li,行%li)",(long)indexPath.section,(long)indexPath.row);
    TLConcatGroup *group=_contacts[indexPath.section];
    TLContact *contact = group.contacts[indexPath.row];
    //由于此方法调用十分频繁,cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    static NSString *cellIdentifierForFirstRow = @"UITableViewCellIdentifierKeyWithSwitch";
    //首先根据标识去缓存池取
    UITableViewCell *cell;
    if(indexPath.row == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        if(indexPath.row == 0){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
            UISwitch *sw = [[UISwitch alloc] init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
        }else{
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }
    }
    if(indexPath.row == 0){
        ((UISwitch *)cell.accessoryView).tag = indexPath.section;
    }
    cell.textLabel.text=[contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    NSLog(@"cell:%@",cell);
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%li）名称",(long)section);
    TLConcatGroup *group=_contacts[section];
    return group.name;
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部（组%li）详情",(long)section);
    TLConcatGroup *group=_contacts[section];
    return group.detail;
}
#pragma mark 返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    for(TLConcatGroup *group in _contacts){
        [indexs addObject:group.name];
    }
    return indexs;
}

#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 50;
    }
    return 40;
}
#pragma mark 设置每行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:( NSIndexPath *)indexPath{
    return 45;
}
#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}
#pragma mark 点击行

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndexPath = indexPath;
    TLConcatGroup *group = _contacts[indexPath.section];
    TLContact *contact = group.contacts[indexPath.row];
    // 创建弹出窗口
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;//设置窗口内容样式
    UITextField *textFiled = [alert textFieldAtIndex:0];//取得文本框
    textFiled.text = contact.phoneNumber;//设置文本框内容
    [alert show];//显示窗口
}
#pragma mark 窗口的代理方法

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    //当点击了第一个按钮ok
    if(buttonIndex == 1){
        UITextField *textFiled = [alertView textFieldAtIndex:0];
        //修改数据模型
        TLConcatGroup *group = _contacts[_selectedIndexPath.section];
        TLContact *contact = group.contacts[_selectedIndexPath.row];
        
        if(![contact.phoneNumber isEqualToString:textFiled.text] ){
            NSLog(@"%@    %@",contact.phoneNumber,textFiled.text);
            contact.phoneNumber = textFiled.text;
            //刷新表格
            NSArray *indexPaths = @[_selectedIndexPath];//需要局部刷新的单元格的组,行
            [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationRight];//后面的参数代表更新时的动画
        }
    
    }
}

#pragma mark 取得当前操作状态，根据不同的状态左侧出现不同的操作按钮
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_isInsert){
        return  UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;

}
#pragma mark 删除操作
//实现了此方法,向左滑动就会显示删除按钮
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    TLConcatGroup *group =_contacts[indexPath.section];
    TLContact *contact=group.contacts[indexPath.row];
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [group.contacts removeObject:contact];
        //考虑到性能这里不建议使用reloadData
        //[tableView reloadData];
        //使用下面的方法既可以局部刷新又有动画效果
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        //如果当前组中没有数据则移除组刷新整个表格
        if (group.contacts.count==0) {
            [_contacts removeObject:group];
            [tableView reloadData];
        }
    }else if(editingStyle==UITableViewCellEditingStyleInsert){
        TLContact *newContact=[[TLContact alloc]init];
        newContact.firstName=@"first";
        newContact.lastName=@"last";
        newContact.phoneNumber=@"12345678901";
        [group.contacts insertObject:newContact atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];//注意这里没有使用reladData刷新
    }
    
}

#pragma mark 排序
//只要实现了这个方法,在编辑状态右侧就有排序图标
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    TLConcatGroup *sourceGroup = _contacts[sourceIndexPath.section];
    TLContact *sourceContact = sourceGroup.contacts[sourceIndexPath.row];
    TLConcatGroup *destinationGroup = _contacts[destinationIndexPath.section];
    
    [sourceGroup.contacts removeObject:sourceContact];
    if(sourceGroup.contacts.count==0){
        [_contacts removeObject:sourceGroup];
        [tableView reloadData];
    }
    [destinationGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
}
//#pragma mark 重写状态样式方法
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
#pragma mark 切换开关转化事件
-(void) switchValueChange:(UISwitch *)sw{
    NSLog(@"section:%li,switch:%i",(long)sw.tag,sw.on);
}



@end
