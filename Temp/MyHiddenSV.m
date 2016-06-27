//
//  MyHiddenSV.m
//  Temp
//
//  Created by daixu on 16/6/8.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "MyHiddenSV.h"
#import "MyHiddenSV+Foo.h"

@implementation MyHiddenSV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.abc = 0;
        NSLog(@"初始值%d \n",self.abc);
    }
    return self;
}
//asswww2

- (void)foo
{
    if ([self isAbc] == 1) {
        NSLog(@"1 \n");
    } else {
        NSLog(@"0");
    }
}

@end
