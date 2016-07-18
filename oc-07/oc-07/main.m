//
//  main.m
//  oc-07
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Account.h"

void Test(){

    Person *p1 = [[Person alloc] init];
    p1.name = @"adad";
    Account *a = [[Account alloc] init];
    a.balance = 10000000;
    p1.account = a;
    a.balance = 2000000;

}
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *p1 = [[Person alloc] init];
        [p1 setValue:@"linna" forKey:@"name"];
        [p1 setValue:@24 forKeyPath:@"age"];//注意即使是一个私有变量任然可以访问
        [p1 showMessage];
        
        NSLog(@"person1's name is :%@,age is :%@",p1.name,[p1 valueForKey:@"age"]);
        
        
        Account *account1 = [[Account alloc] init];
        //注意这一步一定要先给account属性赋值，否则下面按路径赋值无法成功，因为account为nil，当然这一步骤也可以写成:[person1 setValue:account1 forKeyPath:@"account"];
        p1.account = account1;
        
        [p1 setValue:@1000000 forKeyPath:@"account.balance"];
        NSLog(@"p1's balance is : %.2f", [[p1 valueForKeyPath:@"account.balance"] floatValue]);
        Test();
    }
    return 0;
}
