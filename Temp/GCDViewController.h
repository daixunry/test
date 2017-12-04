//
//  GCDViewController.h
//  Temp
//
//  Created by daixu on 2017/5/15.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Test)(BOOL b);

@interface GCDViewController : UIViewController

@property(nonatomic,copy)Test test;

@end
