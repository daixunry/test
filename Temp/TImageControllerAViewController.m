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

@interface TImageControllerAViewController ()
{
    UIImageView *_imgV;
}

@property (nonatomic, strong) NextImgViewController *imgvc;

@end

@implementation TImageControllerAViewController

- (void)dealloc
{
    NSLog(@"TImage dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 200, 200)];
    _imgV.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imgV];
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
