//
//  AdView.h
//  JD4iPhone
//
//  Created by JerryChen on 12-6-27.
//  Copyright (c) 2012年 360buy. All rights reserved.
//




@class JDNJADActivityModel;
@class JDPageControl;
@protocol JDNJAdViewDelegate;
@class JDNJHomeTempateModel;
@interface JDNJAdView : JDContentItem<iCarouselDataSource, iCarouselDelegate>
{
    iCarousel*      _scrollView;
    JDPageControl*  _pageControl;
    
    NSInteger       _currentPageIndex;
    
    NSTimer*        _swapTimer;
}
@property (nonatomic, retain) NSArray* data;
@property (nonatomic, assign) id<JDNJAdViewDelegate> adviewDelegate;
@property (nonatomic, retain) JDNJHomeTempateModel* templateModel;



/**
 *  启动，暂停动画
 *
 *  @param yn 是否启动
 *
 *  @since 3.8.0
 */
- (void) startAnimation:(BOOL)yn;

/**
 *  重新启动
 *
 *  add by clark wang
 *
 *  @since 4.1.0
 */
- (void) resetStartAnimation;
/**
 *  延迟几秒，继续播放
 *
 *  add by clark wang
 *
 *  @since 4.1.0
 */
- (void) postStartAnimation:(float)postDuration;

@end



@protocol JDNJAdViewDelegate <NSObject>

@required

- (void)adView:(JDNJAdView *)adView didSelectActivity:(JDNJADActivityModel *)activityModel;

@end
