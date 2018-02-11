//
//  JDNativeShopTempDelegate.h
//  JD4iPhone
//
//  Created by wangyabo on 14-8-26.
//  Copyright (c) 2014年 360buy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDShopSearchResultControllerDelegate <NSObject>

@optional
- (void)shopScrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)shopScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)shopScrollViewDidScrollToTop:(UIScrollView *)scrollView;
- (void)shopBackToTop;

@end
