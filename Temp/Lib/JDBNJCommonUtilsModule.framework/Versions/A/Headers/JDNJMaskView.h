//
//  JDNJMaskView.h
//  JD4iPhone
//
//  Created by ge on 15/8/31.
//  Copyright (c) 2015年 360buy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CancelBlock)(void);

@interface JDNJMaskView : UIView
{
    UIView *bgView;
}

@property (nonatomic ,strong)UIColor *bgColor;
@property (nonatomic ,assign)CGFloat bgAlpha;
@property (nonatomic ,copy)CancelBlock cancelBlock;
@property (nonatomic ,assign)BOOL canCancel;
@end
