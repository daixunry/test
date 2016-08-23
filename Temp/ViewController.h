//
//  ViewController.h
//  Temp
//
//  Created by daixu on 16/5/25.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (void)doSom;

/*
 params 参数列表
 
 wareId
 
 locParamString
 
 locParams
 
 moreArray
 
 pageView
 
 */
- (UIViewController *)CTMediator_viewControllerForProductDetail:(NSDictionary *)params;

@end

