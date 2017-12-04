//
//  ImageResizableViewController.m
//  Temp
//
//  Created by daixu on 2017/10/30.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "ImageResizableViewController.h"
#import "SWNinePatchImageFactory.h"
@interface ImageResizableViewController ()

@end

@implementation ImageResizableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addIm];
    [self addIm2];
    [self addIm3];
    [self addIm4];
    [self addIm5];
    [self addIm6];
}

- (void)addIm
{
    UIImageView *i = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 100, 39)];
    [i setImage:[UIImage imageNamed:@"wechat"]];
    [self.view addSubview:i];
}

- (void)addIm2
{
    UIImageView *i = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
    [i setImage:[[UIImage imageNamed:@"wechat"] resizableImageWithCapInsets:UIEdgeInsetsMake(39, 50, 39, 50)]];
    [self.view addSubview:i];
}

- (void)addIm3
{
    UIImageView *i = [[UIImageView alloc] initWithFrame:CGRectMake(50, 350, 200, 39)];
    [i setImage:[[UIImage imageNamed:@"wechat"] resizableImageWithCapInsets:UIEdgeInsetsMake(39, 50, 39, 50)]];
    [self.view addSubview:i];
}

- (void)addIm4
{
    UIImageView *i = [[UIImageView alloc] initWithFrame:CGRectMake(50, 450, 200, 100)];
    [i setImage:[[UIImage imageNamed:@"wechat"] resizableImageWithCapInsets:UIEdgeInsetsMake(39, 50, 39, 50)]];
    [self.view addSubview:i];
}

- (void)addIm5
{
    UIImageView *i = [[UIImageView alloc] initWithFrame:CGRectMake(200, 100, 39, 25)];
    [i setImage:[UIImage imageNamed:@"pd_yuyue_no_qianggou@2x"]];
    [self.view addSubview:i];
}

- (void)addIm6
{
    UIImageView *i = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 100, 25)];
//    [i setImage:[TUNinePatchCache imageOfSize:i.bounds.size forNinePatchNamed:@"Combined-Shape-Copy-3"]];
//    [i setImage:[SWNinePatchImageFactory createResizableNinePatchImageNamed:@"Combined-Shape-Copy-3@2x.9"]];
    [self.view addSubview:i];
}

@end
