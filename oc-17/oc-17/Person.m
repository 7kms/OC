//
//  Person.m
//  oc-17
//
//  Created by 魔方 on 16/7/19.
//  Copyright © 2016年 魔方. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)description{
    return [NSString stringWithFormat:@"name=%@,age=%i",_name,_age ];
}

//实现copy方法
-(id)copyWithZone:(NSZone *)zone{
    //注意zone是系统已经分配好的用于存储当前对象的内存
    //注意下面创建对象最好不要用[[Person allocWithZonez:zone] init],因为子类如果没有实现该方法copy时会调用父类的copy方法，此时需要使用子类对象初始化如果此时使用self就可以表示子类对象，还有就是如果子类调用了父类的这个方法进行重写copy也需要调用子类对象而不是父类Person
    Person *person = [[[self class] allocWithZone:zone] init];
    person.name = _name;
    person.age = _age;
    return  person;
}
@end
