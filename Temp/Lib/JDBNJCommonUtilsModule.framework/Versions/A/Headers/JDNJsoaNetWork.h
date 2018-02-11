//
//  JDNJsoaNetWork.h
//  JD4iPhone
//
//  Created by ge on 15/12/30.
//  Copyright © 2015年 JD.com, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JDNJsoaNetWork : NSObject

+ (JDNJsoaNetWork *)manager;

- (void)startWithSetup:(NSString *)soaUrl
             didFinish:(RequestFinishBlock)finishBlock
             didCancel:(RequestCancelBlock)cancelBlock;

@end
