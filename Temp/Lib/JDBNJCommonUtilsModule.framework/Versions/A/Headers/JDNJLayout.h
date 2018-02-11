//
//  JDNJLayout.h
//  JD4iPhone
//
//  Created by ge on 15/8/31.
//  Copyright (c) 2015年 360buy. All rights reserved.
//

#ifndef JD4iPhone_JDNJLayout_h
#define JD4iPhone_JDNJLayout_h

typedef void(^ActionBlock)(NSInteger nIndex);


typedef struct {
    CGFloat  left, right,top, bottom;
} JDNJPadding;



//const JDNJPadding JDNJPaddingZero;

static inline JDNJPadding JDNJPaddingMake(CGFloat l,  CGFloat r,CGFloat t, CGFloat b)
{
    JDNJPadding padding;
    padding.left = l;
    padding.right = r;
    padding.top = t;
    padding.bottom = b;
    return padding;
}


#endif
