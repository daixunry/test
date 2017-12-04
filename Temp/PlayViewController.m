//
//  PlayViewController.m
//  Temp
//
//  Created by daixu on 2017/11/17.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "PlayViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PlayMusicViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self setButton];
    [self setButton2];
    [self setButton3];
}

- (void)setButton
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"play" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)play:(id)sender
{
    //
    NSURL *url = [NSURL URLWithString:@"http://221.204.220.77/mp3.9ku.com/m4a/637791.m4a"];
    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
    vc.player = player;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setButton2
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 40)];
    [btn setTitle:@"play2" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)setButton3
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(300, 100, 100, 40)];
    [btn setTitle:@"play3" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)play2:(id)sender
{
    [self.navigationController pushViewController:[PlayMusicViewController new] animated:YES];
}

- (void)play3:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://download.3g.joy.cn/video/236/60236853/1450837945724_hd.mp4"];
    AVAsset *asset = [AVAsset assetWithURL:url];
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:item];
    
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.frame = CGRectMake(10, 200, 200, 200);
    [self.view.layer addSublayer:layer];
    
    [player play];
}




@end
