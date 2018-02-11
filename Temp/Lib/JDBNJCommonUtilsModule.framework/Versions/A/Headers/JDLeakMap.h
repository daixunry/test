//
//  AllocMap.h
//  BlockTest
//
//  Created by ge on 17/2/22.
//  Copyright © 2017年 ge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLeakMap : NSObject


+(void)startRecord;


+(void)stopRecord;

+(NSArray*)showRecords;



+(void)showInWindow;

@end
