//
//  CommandTools.m
//  Temp
//
//  Created by daixu on 2017/5/22.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "CommandTools.h"

@interface CommandTools ()
{
    NSString *_newArr[2];
}

@end

@implementation CommandTools

- (void)mainCommand {
    [self test1];
    NSLog(@"%@",_newArr[2]);
}

- (void)test1 {
    _newArr[0] = @"a";
    _newArr[1] = @"b";
    _newArr[2] = @"c";
}


@end
