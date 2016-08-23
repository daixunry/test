//
//  ViewB.m
//  Temp
//
//  Created by daixu on 16/7/22.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "ViewB.h"

@implementation ViewB

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"B is tap");
    [super touchesEnded:touches withEvent:event];
}

@end
