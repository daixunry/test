//
//  ViewController.m
//  Temp
//
//  Created by daixu on 16/5/25.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "ViewController.h"
#import "MyHiddenSV.h"
#import <objc/Object.h>
#import "MyHiddenSV+Foo.h"

@interface ViewController ()
{
//    UIView *v1;
//    UIScrollView *scrollV;
//    UIScrollView *scrollV2;
//    UILabel *l;
//    MyHiddenSV *hScrollV;
//    UIImageView *temp;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
        //ababcdcd
    /*
     
DSUEIO
     
     */
    

    

    //aaa
    //bbb
//    [self second];
//    [self third];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark - draw red circle
#if 0
- (void)third
{
    self.view.backgroundColor = [UIColor grayColor];
    temp = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:temp];
    temp.layer.cornerRadius = 50.f;
    temp.layer.shadowColor = [UIColor whiteColor].CGColor;
//    temp.layer.shadowOpacity = 1.0f;
    
//    temp.layer.shouldRasterize = YES;
    temp.clipsToBounds = YES;
    temp.layer.masksToBounds = YES;
    temp.backgroundColor = [UIColor redColor];
    
    UIPanGestureRecognizer *p = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hpT:)];
    [self.view addGestureRecognizer:p];
}

- (void)hpT:(id)aa
{
    NSInteger aaa= 0;
    NSInteger vvv = aaa + 1;
    NSLog(@"aa");
}

#pragma mark - second

- (void)second
{
    hScrollV = [[MyHiddenSV alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    hScrollV.backgroundColor = [UIColor grayColor];
    
    hScrollV.abc = 1;
    [hScrollV foo];
//    scrollV.hidden = YES;
    [self.view addSubview:hScrollV];
//
//    v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    v1.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:v1];
    
//    unsigned int outCount;
//    Ivar *var = class_copyIvarList([UIView class], &outCount);
//    for (int a = 0; a < outCount; a++) {
//        Ivar *nVar = var+a;
//        const char *ivarName = ivar_getName(*nVar);
//        printf("%s \n",ivarName);
//    }
    
//    unsigned int outCount;
//    objc_property_t *pros = class_copyPropertyList([UIView class], &outCount);
//    for (int a = 0; a < outCount; a++) {
//        objc_property_t *proN = pros + a;
//        const char *proName = property_getName(*proN);
//        printf("%s \n",proName);
//    }
    
//    unsigned int outCount;
//    Method *ms = class_copyMethodList([UIView class], &outCount);
//    for (int a = 0; a < outCount; a++) {
//        Method *nms = ms + a;
//        SEL s = method_getName(*nms);
//        NSLog(@"%@ \n",NSStringFromSelector(s));
//        
//    }
}

#pragma mark - first

- (void)first
{
    NSDictionary *t = @{@"k":@"v"};
    NSLog(@"%@",t[@"aa"]);
    
    
    v1 = [[UIView alloc] initWithFrame:CGRectMake(100.99, 100.99, 100.05, 100.01)];
    v1.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    v1.layer.geometryFlipped = NO;
    
    v1.frame = CGRectIntegral(v1.frame);
    l = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    l.text = @"100";
    
    
    
    l.font = [UIFont systemFontOfSize:12];
    l.backgroundColor = [UIColor redColor];
    l.textColor = [UIColor whiteColor];
    l.textAlignment = NSTextAlignmentCenter;
    l.layer.cornerRadius = 5.0f;
    l.layer.masksToBounds = YES;
    
    [v1 addSubview:l];
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    ////        v1.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    //        l.frame = CGRectMake(10, 10, 60, 40);
    //    });
    
    //    UIPanGestureRecognizer *p = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hp:)];
    //    [self.view addGestureRecognizer:p];
    //
    scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    scrollV.backgroundColor = [UIColor redColor];
    scrollV.contentSize = CGSizeMake(self.view.frame.size.width, 600);
    [self.view addSubview:scrollV];
    [scrollV addSubview:v1];
    
    scrollV2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 320, self.view.frame.size.width, 300)];
    scrollV2.backgroundColor = [UIColor blueColor];
    scrollV2.scrollsToTop = NO;
    scrollV2.contentSize = CGSizeMake(self.view.frame.size.width, 600);
    
    UIView *s = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    s.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:scrollV2];
    [scrollV2 addSubview:s];
}

- (void)hp:(UIPanGestureRecognizer *)g
{
    CGFloat scale = [g translationInView:self.view].x/100.0;
    v1.layer.transform = CATransform3DMakeRotation(M_PI*scale, 0, 1, 0);
    
    l.layer.transform = CATransform3DMakeRotation(M_PI*scale/2.0, 0, 1, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#endif

@end
