//
//  JDNJUtils.h
//  JD4iPhone
//
//  Created by ge on 16/3/17.
//  Copyright © 2016年 JD.com, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JDNJCommonUtils : NSObject


+ (void)showDebugTip:(NSString*)strTip;


+ (void)executeBlockOnMainQueue:(dispatch_block_t)block;


@end
