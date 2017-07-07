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
#import "ViewA.h"
#import "ViewB.h"
#import "TableViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UIViewControllerPreviewingDelegate,UITableViewDelegate,UITableViewDataSource>
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
    //[self createButton];
    [self createLayer];
}

+ (CAShapeLayer *)doubleLineOnTopAndBottomOfRect:(CGRect)rect strokColor:(UIColor *)color width:(CGFloat)width {
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(rect.origin.x, rect.origin.y)];
    [linePath addLineToPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y)];
    [linePath moveToPoint:CGPointMake(rect.origin.x, rect.origin.y + rect.size.height - width)];
    [linePath addLineToPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height - width)];
    
    CAShapeLayer *doubleLine = [CAShapeLayer layer];
    doubleLine.path = linePath.CGPath;
    doubleLine.strokeColor = [UIColor redColor].CGColor;
    doubleLine.lineWidth = width;
    doubleLine.frame = rect;
    return doubleLine;
}

- (void)createLayer
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    v.backgroundColor = [UIColor lightGrayColor];
    CAShapeLayer *s = [ViewController doubleLineOnTopAndBottomOfRect:v.bounds strokColor:[UIColor redColor] width:1];
    [v.layer addSublayer:s];
    
    [self.view addSubview:v];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)createButton
{
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [b setTitle:@"table view" forState:UIControlStateNormal];
    [b setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:b];
    
    [b addTarget:self action:@selector(gotoTableV:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)gotoTableV:(id)sender
{
    TableViewController *t = [TableViewController new];
    [self presentViewController:t animated:YES completion:nil];
}

#if 0

- (void)testlabel
{
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    la.text = @"好看的电影，好玩的游戏，好玩的景点，好吃的东西,好看的电影，好玩的游戏，好玩的景点，好吃的东西,好看的电影，好玩的游戏，好玩的景点，好吃的东西";
    
    
//    [la sizeToFit];
    la.numberOfLines = 4;
    
    [self.view addSubview:la];
}






//ssssstttt
- (void)lszesss
{
    UILabel *_yuyueStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 13)];
    _yuyueStateLabel.backgroundColor = [UIColor orangeColor];
    _yuyueStateLabel.font = [UIFont systemFontOfSize:13];
    _yuyueStateLabel.textColor = [UIColor blueColor];
    
    _yuyueStateLabel.text = @"距离距离距离aaa";
    [_yuyueStateLabel sizeToFit];
    [self.view addSubview:_yuyueStateLabel];
}

#pragma mark - ges uitouch

//152 × 96 p
- (void)btntest
{
    
    UIImageView *a = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 48)];
    a.image = [[UIImage imageNamed:@"pd_mainImage_video_icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(24, 50, 24, 26)];
    [self.view addSubview:a];
    return;
//    
//    UIButton *a= [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 0, 48)];
//    [self.view addSubview:a];
//    NSString *t = @"02\'33\"";
//    CGSize s = [t sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
//    a.frame = CGRectMake(100, 100, s.width+58, 48);
//    //    [a setImage:[[UIImage imageNamed:@"pd_mainImage_video_icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(24, 50, 24, 26)] forState:UIControlStateNormal];
//    [a setBackgroundImage:[[UIImage imageNamed:@"pd_mainImage_video_icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(24, 50, 24, 26)] forState:UIControlStateNormal];
//    [a setTitle:t forState:UIControlStateNormal];
//    [a setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [a setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
//    [a.titleLabel setFont:[UIFont systemFontOfSize:16]];
//    [a setTitleEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
}

- (void)gestou
{
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    ViewA *A = [[ViewA alloc] initWithFrame:CGRectMake(100, 100, 300, 500)];
    A.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:A];
    
    
    UITableView *ta = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 150, 300)];
    ta.dataSource = self;
    ta.delegate = self;
    [A addSubview:ta];
//    ViewB *B = [[ViewB alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    B.backgroundColor = [UIColor redColor];
//    [A addSubview:B];
    
    UITapGestureRecognizer *Ages = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tpA:)];
    Ages.cancelsTouchesInView = NO;
    [A addGestureRecognizer:Ages];
    
//    UITapGestureRecognizer *Bges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tpB:)];
//    [B addGestureRecognizer:Bges];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *inde = @"x";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inde];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inde];
        cell.textLabel.text = [NSString stringWithFormat:@"ROW %zd",indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select Row :%zd",indexPath.row);
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    return nil;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{

}


- (void)tpB:(id)sender
{
    NSLog(@"B gesture");
}

- (void)tpA:(id)sender
{
    NSLog(@"A gesture");
}



#pragma mark - button test


#pragma mark - inset test

- (void)firth
{
//    [UIStatusBar ]
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIScrollView *s = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    s.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:s];
    s.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    s.contentSize = CGSizeMake(self.view.bounds.size.width, 1000);
    s.delegate = self;
    
    
//    s.contentOffset = CGPointMake(0, 0);
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(20, 0, self.view.bounds.size.width-40, 50)];
    v.backgroundColor = [UIColor redColor];
    [s addSubview:v];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark - archiver

- (void)doSom
{
    NSLog(@"vc do som");
}

- (void)fourth
{
    NSData *data = [@"foo" dataUsingEncoding:NSUTF8StringEncoding];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//    NSString *base = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *path = [base stringByAppendingString:@"aaaa"];
////    NSString *data = [[@"aa" dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    NSData *data2 = [[@"aa" dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    BOOL result = [NSKeyedArchiver archiveRootObject:@"0x70" toFile:path];
//    if (result) {
//        NSString * obj = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
////        NSString *re = [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:obj options:NSDataBase64DecodingIgnoreUnknownCharacters] encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",obj);
//    } else {
//        NSLog(@"fail");
//    }
    
    //    NSLog(@"NSLibraryDirectory : %@",NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES));
//    NSLog(@"NSCachesDirectory : %@",NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES));
//    NSLog(@"NSDocumentDirectory : %@",);
//    NSLog(@"%@",NSHomeDirectory());
//    
//    NSDirectoryEnumerator *dir = [[[NSFileManager alloc] init] enumeratorAtPath:NSHomeDirectory()];
//    for (NSString *p in dir) {
//        NSLog(@"%@",dir);
//    }
    
//    NSFileManager
//    [NSKeyedUnarchiver unarchiveObjectWithFile:<#(nonnull NSString *)#>];
}

#pragma mark - draw red circle

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
