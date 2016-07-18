//
//  main.m
//  oc-04
//
//  Created by tangliang on 16/7/17.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCButton.h"
#import "MyListener.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        KCButton *button = [[KCButton alloc] init];
        MyListener *listener = [[MyListener alloc] init];
        button.delegate = listener;
        [button click];
    
    }
    return 0;
}
