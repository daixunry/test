//
//  DXBusinessHelper.m
//  Temp
//
//  Created by daixu on 16/6/7.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "DXBusinessHelper.h"

@implementation DXBusinessHelper

- (void)myBtnTap:(UIButton *)btn
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Test" message:@"myBtnTap" preferredStyle:UIAlertControllerStyleAlert];
    [((UIViewController *)self.delegate) presentViewController:alert animated:YES completion:nil];
}

@end
