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
@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    /*self.queue = dispatch_queue_create("jd.test", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i ++) {
        dispatch_async(self.queue, ^{
            [NSThread sleepForTimeInterval:3];
            NSLog(@"xxxx:--%d",i);
        });
    }*/
//    NSString *jd = @"test";
//    void (^b)(void) = ^{
//        NSLog(@"%@",jd);
//    };
//    jd = @"test1";
//    b();
}

@end
