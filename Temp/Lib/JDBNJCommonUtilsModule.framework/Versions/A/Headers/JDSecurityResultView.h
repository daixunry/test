//
//  JDSecurityResultView.h
//  验证码获取结果：获取成功或者失败
//
//  Created by louhongliang on 13-12-14.
//  Copyright (c) 2013年 louhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "JDShopHomeViewController.h"

@protocol JDSecurityResultDelegate <NSObject>

- (void)securityConnectPay;

@end

@interface JDSecurityResultView : UIView{
    UILabel *m_successTitle;
    UIButton *m_shopButton;
}

@property(nonatomic, assign)BOOL result;
@property(nonatomic, assign)id<JDSecurityResultDelegate> delegate;


- (void)setResult:(BOOL)resultCode;

@end
