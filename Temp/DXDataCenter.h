//
//  DXDataCenter.h
//  Temp
//
//  Created by daixu on 16/6/7.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DXDataCenterProtocol;

@interface DXDataCenter : NSObject

@property (weak, nonatomic) id<DXDataCenterProtocol> delegate;

- (void)fetchData;

@end

@protocol DXDataCenterProtocol <NSObject>

@property (strong, nonatomic) DXDataCenter *dataCenter;

@end
