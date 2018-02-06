//
//  HookTestView.m
//  Temp
//
//  Created by daixu on 2017/12/25.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "HookTestView.h"
#import "ForParV.h"
@implementation HookTestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ForParV *test = [[ForParV alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dodo:)];
        [test addGestureRecognizer:ges];
        [self addSubview:test];
        test.backgroundColor = [UIColor blueColor];
//        self.exclusiveTouch
    }
    return self;
}
- (void)dodo:(id)sender
{
    NSLog(@"dodo");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"before haha");
    [super touchesEnded:touches withEvent:event];
    NSLog(@"haha");
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//
//}

@end
