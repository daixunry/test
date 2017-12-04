//
//  PlayMusicViewController.m
//  Temp
//
//  Created by daixu on 2017/11/20.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "PlayMusicViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayMusicViewController ()<UIGestureRecognizerDelegate>
{
    BOOL _isPlaying;
    CGFloat _duration;
    CGFloat process_pan;
    BOOL ispaning;
    id ob1;
    id ob2;
}
@property(nonatomic,strong) UIButton *playBtn;
@property(nonatomic,strong) UILabel *nowTimeLabel;
@property(nonatomic,strong) UILabel *allTimeLabel;
@property(nonatomic,strong) UIView *allLine;
@property(nonatomic,strong) UIView *nowLine;
@property(nonatomic,strong) UIView *nowPoint;
@property(nonatomic,strong) AVPlayer *player;
@property(nonatomic,strong) AVPlayerItem *playerItem;



@end

@implementation PlayMusicViewController

- (void)viewDidLoad {
//    [[AVAudioSession sharedInstance] setActive:YES error:NULL];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInterreption:) name:AVAudioSessionInterruptionNotification object:[AVAudioSession sharedInstance]];
    [super viewDidLoad];
    [self setButton];
    self.player = [[AVPlayer alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
}

-(void)handleInterreption:(NSNotification *)sender
{
    if(_isPlaying)
    {
        [self.player pause];
        _isPlaying=NO;
    }
    else
    {
        [self.player play];
        _isPlaying=YES;
    }
}

- (void)setUI
{
    [self.view addSubview:self.playBtn];
    [self.view addSubview:self.nowTimeLabel];
    [self.view addSubview:self.allTimeLabel];
    [self.view addSubview:self.allLine];
    [self.view addSubview:self.nowLine];
    [self.view addSubview:self.nowPoint];
    
    [self.playBtn setTitle:@"unknown" forState:UIControlStateNormal];
    self.nowTimeLabel.text = @"00:00:00";
    self.allTimeLabel.text = @"00:00:00";
}

- (void)setButton
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"play" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

NSInteger playItemContent = 0;
bool is1 = YES;
- (void)play:(id)sender
{
    [self.player pause];
    [self.playerItem removeObserver:self forKeyPath:@"status"];

    NSURL *url;
    NSURL *url1 = [NSURL URLWithString:@"http://221.204.220.77/mp3.9ku.com/m4a/637791.m4a"];
    NSURL *url2 = [NSURL URLWithString:@"http://221.204.220.77/mp3.9ku.com/m4a/464446.m4a"];

    if (is1) {
        url = url1;
        is1 = NO;
    } else {
        url = url2;
        is1 = YES;
    }
    
    AVAsset *asset = [AVAsset assetWithURL:url];
    
    self.playerItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:&playItemContent];
//    [self.playerItem addObserver:self forKeyPath:@"currentTime" options:NSKeyValueObservingOptionNew context:&playItemContent];
    
    
    
    [self.player replaceCurrentItemWithPlayerItem:self.playerItem];
//    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
//    layer.backgroundColor = [UIColor blackColor].CGColor;
//    layer.frame = CGRectMake(10, 200, 200, 200);
}

#pragma mark - kvo

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context != &playItemContent) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if ([keyPath isEqualToString:@"status"]) {
        NSInteger status = 0;
        if ([change[NSKeyValueChangeNewKey] isKindOfClass:[NSNumber class]]) {
            status = [change[NSKeyValueChangeNewKey] integerValue];
        }
        switch (status) {
            case AVPlayerStatusFailed:
                [self.playBtn setTitle:@"fuck" forState:UIControlStateNormal];
                break;
            case AVPlayerStatusUnknown:
                [self.playBtn setTitle:@"unknown" forState:UIControlStateNormal];
                break;
            case AVPlayerStatusReadyToPlay:
            {
                [self.playBtn setTitle:@"start" forState:UIControlStateNormal];
                _duration = CMTimeGetSeconds(self.playerItem.asset.duration);
                self.allTimeLabel.text = [self getTimeStringFromSeconds:_duration];
                __weak typeof(self) ws2 = self;
                ob1 = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
                    __strong PlayMusicViewController *ws = ws2;
                    
                    if (ws->ispaning || !ws.player) {
                        return;
                    }
                    
                    ws.nowTimeLabel.text = [ws getTimeStringFromSeconds:CMTimeGetSeconds(ws.player.currentTime)];
                    
                    CGFloat process = CMTimeGetSeconds(ws.player.currentTime)/ws->_duration;
                    ws.nowLine.frame = CGRectMake(ws.nowLine.frame.origin.x, ws.nowLine.frame.origin.y, CGRectGetWidth(ws.allLine.frame)*process, ws.nowLine.frame.size.height);
                    ws.nowPoint.frame = CGRectMake(CGRectGetMaxX(ws.nowLine.frame)-5, ws.nowPoint.frame.origin.y, 20, 20);
                }];
                ob2 = [self.player addBoundaryTimeObserverForTimes:@[[NSValue valueWithCMTime:self.playerItem.asset.duration]] queue:dispatch_get_main_queue() usingBlock:^{
                    __strong typeof(ws2) ws = ws2;
                    [ws.playBtn setTitle:@"end" forState:UIControlStateNormal];
                    [ws clean];
                }];
            }
                
                break;
                
            default:
                break;
        }
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self clean];
}

- (void)clean
{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.player pause];
        [self.player replaceCurrentItemWithPlayerItem:nil];
        [self.player removeTimeObserver:ob1];
        [self.player removeTimeObserver:ob2];
        [self.playerItem removeObserver:self forKeyPath:@"status"];
    
    self.player = nil;
    self.playerItem = nil;
        //    [[AVAudioSession sharedInstance] setActive:yes error:nil];
//        [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
        
//    });
    
}

- (void)dealloc
{
//    [[AVAudioSession sharedInstance] setActive:YES error:NULL];
//    BOOL s = [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    BOOL s2 = [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:NULL];
}


-(NSString *)getTimeStringFromSeconds:(double)seconds
{
    NSDateComponentsFormatter *dcFormatter = [[NSDateComponentsFormatter alloc] init];
    dcFormatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    dcFormatter.allowedUnits = NSCalendarUnitHour | NSCalendarUnitMinute | kCFCalendarUnitSecond;
    dcFormatter.unitsStyle = NSDateComponentsFormatterUnitsStylePositional;
    return [dcFormatter stringFromTimeInterval:seconds];
}

- (void)realPlay:(id)sender
{
    if (_isPlaying) {
        [self.player pause];
        _isPlaying = NO;
        return;
    }
    
    if (self.playerItem.status == AVPlayerStatusReadyToPlay) {
        [self.player play];
        _isPlaying = YES;
    }
}

#pragma mark - getter,setter

- (UIButton *)playBtn
{
    if (!_playBtn) {
        _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 44, 44)];
        [_playBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_playBtn setTitle:@"unknown" forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(realPlay:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}

- (UILabel *)nowTimeLabel
{
    if (!_nowTimeLabel) {
        _nowTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 210, 60, 15)];
        _nowTimeLabel.textColor = [UIColor grayColor];
        _nowTimeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _nowTimeLabel;
}

- (UILabel *)allTimeLabel
{
    if (!_allTimeLabel) {
        _allTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 210, 60, 15)];
        _allTimeLabel.textColor = [UIColor grayColor];
        _allTimeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _allTimeLabel;
}

- (UIView *)allLine
{
    if (!_allLine) {
        _allLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nowTimeLabel.frame) + 5,
                                                            220,
                                                            CGRectGetMinX(self.allTimeLabel.frame) - (CGRectGetMaxX(self.nowTimeLabel.frame)) - 10,
                                                            10)];
        _allLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _allLine;
}

- (UIView *)nowLine
{
    if (!_nowLine) {
        _nowLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nowTimeLabel.frame) + 5,
                                                            220,
                                                            0,
                                                            10)];
        _nowLine.backgroundColor = [UIColor blueColor];
    }
    return _nowLine;
}

- (UIView *)nowPoint
{
    if (!_nowPoint) {
        _nowPoint = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nowTimeLabel.frame) + 5,
                                                            215,
                                                            20,
                                                            20)];
        _nowPoint.backgroundColor = [UIColor blueColor];
        _nowPoint.layer.cornerRadius = 10;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(seek:)];
        pan.delegate = self;
        [_nowPoint addGestureRecognizer:pan];
    }
    return _nowPoint;
}

- (void)seek:(UIPanGestureRecognizer *)ges
{
    if (ges.state == UIGestureRecognizerStateBegan) {
        process_pan = CGRectGetWidth(self.nowLine.frame);
        ispaning = YES;
    }
    if (ges.state == UIGestureRecognizerStateChanged) {
        
        CGFloat wid = process_pan + [ges translationInView:self.view].x;
        
        self.nowTimeLabel.text = [self getTimeStringFromSeconds:(wid/CGRectGetWidth(self.allLine.frame))*_duration];
        
        self.nowLine.frame = CGRectMake(self.nowLine.frame.origin.x, self.nowLine.frame.origin.y, wid, self.nowLine.frame.size.height);
        self.nowPoint.frame = CGRectMake(CGRectGetMaxX(self.nowLine.frame)-5, self.nowPoint.frame.origin.y, 20, 20);
    }
    if (ges.state == UIGestureRecognizerStateCancelled || ges.state == UIGestureRecognizerStateFailed) {
        NSLog(@"fail");
        ispaning = NO;
    }
    if (ges.state == UIGestureRecognizerStateEnded) {
        
        CGFloat process = CGRectGetWidth(self.nowLine.frame)/CGRectGetWidth(self.allLine.frame);
        [self.player seekToTime:CMTimeMake(process*_duration, 1) completionHandler:^(BOOL finished) {
        ispaning = NO;
        }];
        
    }
}

@end
