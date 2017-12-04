//
//  GCDViewController.m
//  Temp
//
//  Created by daixu on 2017/5/15.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()
@property (nonatomic,strong)dispatch_queue_t queue;

@property(nonatomic,copy)NSString *aa;

@end

@implementation GCDViewController

- (void)dealloc
{
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.test = ^(BOOL b){
        NSLog(@"test");
    };
    
    NSLog(@"begin");
    __weak typeof(self) w_self = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        w_self.aa = @"";
//        w_self.test(YES);
//        w_self.test(YES);
        NSLog(@"%@",self.test);
        NSLog(@"end");
        
    });
    
//
//    self.queue = dispatch_queue_create("jd.test", DISPATCH_QUEUE_SERIAL);
////    for (int i = 0; i < 10; i ++) {
//
//    void (^test)(void) = ^{
//        dispatch_sync(self.queue, ^{
//            NSLog(@"aa :%@",[NSThread currentThread]);
//        });
//    };
//
//    test();
    
//    }
//    NSString *jd = @"test";
//    void (^b)(void) = ^{
//        NSLog(@"%@",jd);
//    };
//    jd = @"test1";
//    b();
}

@end
