//
//  DXViewHelper.m
//  Temp
//
//  Created by daixu on 16/6/7.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "DXViewHelper.h"

@implementation DXViewHelper

- (void)createSubViews
{
    self.myBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    self.myBtn.backgroundColor = [UIColor grayColor];
    
//    id<dxbu>
//    
//    [self.myBtn addTarget: action:@selector(myBtnTap:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)layoutSubView
{
    [((UIViewController *)self.delegate).view addSubview:self.myBtn];
}

@end
