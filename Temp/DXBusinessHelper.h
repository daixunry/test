//
//  DXBusinessHelper.h
//  Temp
//
//  Created by daixu on 16/6/7.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DXBusinessHelperProcotol;

@interface DXBusinessHelper : NSObject

@property (weak, nonatomic) id<DXBusinessHelperProcotol> delegate;

#pragma mark - function action

- (void)myBtnTap:(UIButton *)btn;

@end

@protocol DXBusinessHelperProtocol <NSObject>

@property (strong, nonatomic) DXBusinessHelper *business;

@end
