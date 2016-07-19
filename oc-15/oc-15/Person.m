//
//  Person.m
//  oc-15
//
//  Created by tangliang on 16/7/18.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "Person.h"

@implementation Person


-(Person *)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        self.name = name;
    }
    return self;
}
+(Person *)personWithName:(NSString *)name{
    Person *person = [[Person alloc] initWithName:name];
    return person;
}
-(void)showMessage:(NSString *)infomation{

    NSLog(@"My name is %@, the information is \"%@\".",self.name,infomation);
}

//自己实现对象比较方法
-(NSComparisonResult)comparePerson:(Person *)person{
    return  [_name compare:person.name];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"name=%@",_name ];
}
@end
