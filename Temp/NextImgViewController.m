//
//  NextImgViewController.m
//  Temp
//
//  Created by daixu on 2017/8/14.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "NextImgViewController.h"
#import "SDWebImage/SDWebImage/SDImageCache.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
//1
@interface NextImgViewController ()
{
UIImageView *_imgV;
}
@end
//aab
@implementation NextImgViewController
- (void)aaabbb
{
    
}

- (void)dealloc
{
    NSLog(@"Next dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 200, 200)];
    _imgV.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imgV];
    SDWebImageManager.sharedManager.imageCache.shouldCacheImagesInMemory = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    SDWebImageManager.sharedManager.imageCache.shouldCacheImagesInMemory = YES;
}

- (void)test:(NSString *) a
      funkey:(NSInteger) b {

}

//haha
//1
//2

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)downlog:(id) sender {
    NSURL *imgUrl = [NSURL URLWithString:@"https://img14.360buyimg.com/n0/jfs/t3214/210/5371788844/209183/739ed058/586dec4fN74885856.jpg"];
    NSString *cacheKey = [SDWebImageManager.sharedManager cacheKeyForURL:imgUrl];
    UIImage *img = [SDWebImageManager.sharedManager.imageCache imageFromMemoryCacheForKey:cacheKey];
    NSLog(@"第二个controller：之前的cache在不在：%@",img);
    [_imgV sd_setImageWithURL:imgUrl];
    
//    _imgV.nextResponder
    UIButton *btn = [UIButton new];
//    [btn allTargets];
//    [btn actionsForTarget:hander forControlEvent:UIControlEventTouchUpInside]
//    btn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
//    btn targetForAction:<#(nonnull SEL)#> withSender:<#(nullable id)#>
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
