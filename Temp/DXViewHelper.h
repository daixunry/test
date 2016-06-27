//
//  DXViewHelper.h
//  Temp
//
//  Created by daixu on 16/6/7.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DXViewHelperProtocol;

@interface DXViewHelper : NSObject

@property (weak, nonatomic) id<DXViewHelperProtocol> delegate;

#pragma mark - view center

@property (strong, nonatomic) UIButton *myBtn;

#pragma mark - function public

- (void)createSubViews;

- (void)layoutSubView;

@end

@protocol DXViewHelperProtocol <NSObject>

@property (strong, nonatomic) DXViewHelper *viewHelper;

@end
