//
//  main.m
//  oc-06
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        [p1 autorelease];//调用了autorelease方法后面就不需要手动调用release方法了
        p1.name = @"p1";//由于autorelease是延迟释放，所以这里仍然可以使用person1
        
        Person *p2 = [[[Person alloc] initWithName:@"p2"] autorelease];//调用了autorelease方法
        
        Person *p3 = [Person personWithName:@"p3"];//静态方法内部已经调用了autorelease,所以不需要手动释放,这也符合内存管理原则,因为这里并没有alloc所以不需要release或者autorelease
        
        Person *p4 = [Person personWithName:@"p4"];
        [p4 retain];
    
    }
    return 0;
}
//当上面@autoreleaespool代码块执行完之后，三个对象都得到了释放，但是person4并没有释放，原因很简单，由于我们手动retain了一次，当自动释放池释放后调用四个对的release方法，当调用完person4的release之后它的引用计数器为1，所有它并没有释放（这是一个反例，会造成内存泄露）；autorelase方法将一个对象的内存释放延迟到了自动释放池销毁的时候，因此上面person1，调用完autorelase之后它还存在，因此给name赋值不会有任何问题；在ObjC中通常如果一个静态方法返回一个对象本身的话，在静态方法中我们需要调用autorelease方法，因为按照内存释放原则，在外部使用时不会进行alloc操作也就不需要再调用release或者autorelase，所以这个操作需要放到静态方法内部完成。


//对于自动内存释放简单总结一下：

//autorelease方法不会改变对象的引用计数器，只是将这个对象放到自动释放池中；
//自动释放池实质是当自动释放池销毁后调用对象的release方法，不一定就能销毁对象（例如如果一个对象的引用计数器>1则此时就无法销毁）；
//由于自动释放池最后统一销毁对象，因此如果一个操作比较占用内存（对象比较多或者对象占用资源比较多），最好不要放到自动释放池或者考虑放到多个自动释放池；
//ObjC中类库中的静态方法一般都不需要手动释放，内部已经调用了autorelease方法；

