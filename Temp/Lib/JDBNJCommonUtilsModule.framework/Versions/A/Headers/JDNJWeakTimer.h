//
//  JDNJWeakTimer.h
//  JD4iPhone
//
//  Created by ge on 17/1/23.
//  Copyright © 2017年 JD.com, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDNJWeakTimer : NSObject

@property (nonatomic ,assign)BOOL isFire;

-(id)initWithTimeInterval:(NSTimeInterval)timeInterval target:(id)aTarget selector:(SEL)aSelector  repeats:(BOOL)repeat;

//开始
- (void)startTimer;
//停止
- (void)stopTimer;

//暂停
- (void)pauseTimer;
//恢复
- (void)resumeTimer;
@end
