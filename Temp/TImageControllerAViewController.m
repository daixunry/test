//
//  TImageControllerAViewController.m
//  Temp
//
//  Created by daixu on 2017/8/11.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "TImageControllerAViewController.h"
#import "SDWebImage/SDWebImage/SDImageCache.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "NextImgViewController.h"
#import "SDWebImageDownloader.h"

@interface TImageControllerAViewController ()
{
    UIImageView *_imgV;
    UIImageView *_imgV2;
}

@property (nonatomic, strong) NextImgViewController *imgvc;

@end
//commit 2
@implementation TImageControllerAViewController
//bbb
- (void)dealloc
{
    NSLog(@"TImage dealloc");
}


- (void)downloadImages
{
    NSString *icon = @"http://d.hiphotos.baidu.com/zhidao/pic/item/71cf3bc79f3df8dc9a65cb8acb11728b47102854.jpg";
    NSString *icon_center = @"http://c.hiphotos.baidu.com/zhidao/pic/item/1f178a82b9014a909461e9baa1773912b31bee5e.jpg";
    NSString *icon_tail = @"http://d.hiphotos.baidu.com/zhidao/pic/item/024f78f0f736afc34a24c98eb119ebc4b7451234.jpg";
    dispatch_semaphore_t sem = dispatch_semaphore_create(1);
    
        
        /*dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, <#unsigned long flags#>), <#^(void)block#>)
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self doLayout];
        });*/
}

- (void)doLayout
{
    NSLog(@"okkk");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadImages];
    
    // Do any additional setup after loading the view from its nib.
    
    _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    _imgV.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imgV];
    
    _imgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 300, 300, 48)];
    _imgV2.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imgV2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loadimage:(id)sender {
    NSURL *imgUrl = [NSURL URLWithString:@"https://img14.360buyimg.com/n0/jfs/t5746/114/5095948289/270694/1bc7eb6/595a002aN3f0ba555.jpg"];
    NSString *cacheKey = [SDWebImageManager.sharedManager cacheKeyForURL:imgUrl];
    UIImage *img = [SDWebImageManager.sharedManager.imageCache imageFromMemoryCacheForKey:cacheKey];
    NSLog(@"之前的cache在不在：%@",img);
    [_imgV sd_setImageWithURL:imgUrl];
}

- (IBAction)gotonext:(id)sender {
    self.imgvc = [NextImgViewController new];
    [self.navigationController pushViewController:self.imgvc animated:YES];
}

- (IBAction)load1:(id)sender {
    [self mutableStringTest];
    _imgV2.image = nil;
    _imgV2.image = [UIImage imageNamed:@"pd_yuyue_qianggou"];
}

- (void)mutableStringTest
{
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"abc"];
//    [str appendString:nil];
    NSLog(@"%@",str);
}

- (IBAction)str1:(id)sender {
    _imgV2.image = nil;
    _imgV2.image = [[UIImage imageNamed:@"pd_yuyue_qianggou"] resizableImageWithCapInsets:UIEdgeInsetsMake(12, 5, 12, 33) resizingMode:UIImageResizingModeStretch];
}

- (IBAction)str2:(id)sender {
    _imgV2.image = nil;
    _imgV2.image = [[UIImage imageNamed:@"pd_mainImage_video_icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(24, 50, 24, 24) resizingMode:UIImageResizingModeStretch];
//    _imgV2.image = [UIImage imageNamed:@"pd_mainImage_video_icon"];
//    _imgV2.contentMode = UIViewContentModeScaleAspectFit;
}

@end
