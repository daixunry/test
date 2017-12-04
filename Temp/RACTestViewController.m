//
//  RACTestViewController.m
//  Temp
//
//  Created by daixu on 2017/10/16.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "RACTestViewController.h"
#import "ReactiveCocoa.h"

@interface RACTestViewController ()

@end

@implementation RACTestViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    __block NSInteger a = 0;
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        a++;
        NSLog(@"%d",a);
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //[self testrac];
    
}

- (void)a_testrac
{
    
}

- (void)a_testrac_1
{
    NSInteger a = 2;
    NSInteger b = 2;
    NSInteger c = a + b;// c = 4
    
    b = 3;
    // c = ?
}

- (void)testrac
{
    [self testrac_1];
    //[self testrac0];
    //[self testrac1];
    //[self testrac2];
}

- (void)testrac_1
{
    NSArray *array1 = @[@"a", @"b", @"c"];
    NSArray *array2 = @[@1, @2, @3];
    // 这里又用到了map函数（映射），马上就会讲到
    RACSequence *seq1 = [array1.rac_sequence map:^id(id value) {
        NSLog(@"lazy value = %@", value);
        return value;
    }];
    
    RACSequence *seq2 = [array2.rac_sequence.eagerSequence map:^id(id value) {
        NSLog(@"eager value = %@", value);
        return value;
    }];
    
    NSArray *newArray1 = seq1.array;
    NSArray *newArray2 = seq2.array;
}

- (void)testrac0
{
    RACSubject *subject = [RACSubject subject];
    [subject.rac_willDeallocSignal subscribeCompleted:^{
        NSLog(@"subject dealloc");
    }];
    
    [[subject map:^id(NSNumber *value) {
        return @([value integerValue] * 3);
    }] subscribeNext:^(id x) {
        NSLog(@"next = %@", x);
    }];
    [subject sendNext:@1];
}

- (void)testrac1
{
    __block NSInteger aa = 0;
    RACSignal *sig1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        aa++;
        [subscriber sendNext:@(aa)];
        return nil;
    }];
    
    RACSignal *pub = [[sig1 publish] autoconnect];
    
    [pub subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [pub subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)testrac2
{
    RACSubject *subject = [RACSubject subject];
    [subject subscribeNext:^(id x) {
        NSLog(@"订阅者1%@", x);
    }];
    
    [subject sendNext:@"subject1"];
    
    [subject subscribeNext:^(id x) {
        NSLog(@"订阅者2%@", x);
    }];
    
    [subject sendNext:@"subject2"];
}

@end
