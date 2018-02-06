//
//  HookViewController.m
//  Temp
//
//  Created by daixu on 2017/12/25.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "HookViewController.h"
#import "HookTestView.h"
#import "Aspects.h"
#import "ForChirV.h"

@interface HookViewController ()

@end

@implementation HookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    HookTestView *v = [[HookTestView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];

    HookTestView *v2 = [[HookTestView alloc] initWithFrame:CGRectMake(10, 220, 100, 100)];
    v2.backgroundColor = [UIColor redColor];
    [self.view addSubview:v2];
    
    ForParV *test = [[ForParV alloc] initWithFrame:CGRectMake(200, 100, 50, 50)];
    [self.view addSubview:test];
    test.backgroundColor = [UIColor blueColor];
    
//    ForChirV *t = [ForChirV new];
//    [t performSelector:@selector(test)];
    
//    id sc = (id)UIViewController;
//    NSLog(@"%@",object_getClass(sc));
//    [HookViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionBefore usingBlock:^(){
//        NSLog(@"1");
//    } error:NULL];

//    [UIViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionBefore usingBlock:^(){
//        NSLog(@"2");
//    } error:NULL];
    
//    [v aspect_hookSelector:@selector(touchesEnded:withEvent:) withOptions:AspectPositionBefore usingBlock:^(){
//        NSLog(@"before1");
//    } error:nil];
//
//    [UIResponder aspect_hookSelector:@selector(touchesEnded:withEvent:) withOptions:AspectPositionBefore usingBlock:^(){
//        NSLog(@"before2");
//    } error:nil];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"view tap");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"ss");
}


@end
