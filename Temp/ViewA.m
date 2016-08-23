//
//  ViewA.m
//  Temp
//
//  Created by daixu on 16/7/22.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "ViewA.h"

@implementation ViewA

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"A is tap");
    [super touchesEnded:touches withEvent:event];
}

@end
