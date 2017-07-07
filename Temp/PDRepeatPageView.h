//
//  PDRepeatPageView.h
//  Temp
//
//  Created by daixu on 16/9/18.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewProductModel;
@protocol PDViewProtocol <NSObject>
@optional
- (void)resetState;
- (void)renderUIWithProductModel:(NewProductModel *)model;
@end

@interface PDRepeatPageView : UIView<PDViewProtocol>

@end
