//
//  VCContent.h
//  Temp
//
//  Created by daixu on 16/6/7.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ViewHelperActionType,
    BusinessActionType,
    DataCenterActionType,
} ActionType;

@interface VCContent : NSObject

- (BOOL)registerAction:(SEL)selector forIdentify:(NSString *)identify;

//- (id)doAction:(nss)


@end
