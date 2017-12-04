//
//  MyHiddenSV+Foo.m
//  Temp
//
//  Created by daixu on 16/6/8.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "MyHiddenSV+Foo.h"
#import <objc/runtime.h>
@implementation MyHiddenSV (Foo)
static const NSString *keyy = @"aaaaaa";
- (int)isAbc
{
    NSLog(@"category go");
    return (int)[objc_getAssociatedObject(self, (__bridge const void *)(keyy)) integerValue];
}

- (void)setAbc:(int)abc
{
    objc_setAssociatedObject(self, (__bridge const void *)(keyy), @(abc), OBJC_ASSOCIATION_ASSIGN);
}

//""aaaawww
//sssssss2222
@end
