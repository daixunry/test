//
//  DXViewController.m
//  Temp
//
//  Created by daixu on 16/6/7.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "DXViewController.h"
#import "DXBusinessHelper.h"
#import "DXViewHelper.h"
#import "DXDataCenter.h"

@interface DXViewController () <DXBusinessHelperProtocol, DXViewHelperProtocol, DXDataCenterProtocol>

@end

@implementation DXViewController
@synthesize business,viewHelper,dataCenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createHelpers];
    [self fetchData];
    [self createSubViews];
    [self layoutSubView];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)doSom
{
    NSLog(@"dx vc do som");
}

- (void)createHelpers
{
    self.business = [DXBusinessHelper new];
    self.business.delegate = self;
    self.dataCenter = [DXDataCenter new];
    self.dataCenter.delegate = self;
    self.viewHelper = [DXViewHelper new];
    self.viewHelper.delegate = self;
}

- (void)fetchData
{
    [self.dataCenter fetchData];
}

- (void)createSubViews
{
    [self.viewHelper createSubViews];
}

- (void)layoutSubView
{
    [self.viewHelper layoutSubView];
}
//
//- (DXDataCenter *)dataCenter
//{
//    return self.dataCenter;
//}
//
//- (void)setDataCenter:(DXDataCenter *)dataCenter
//{
//    self.dataCenter = dataCenter;
//}
//
//- (DXViewHelper *)viewHelper
//{
//    return self.viewHelper;
//}
//
//- (void)setViewHelper:(DXViewHelper *)viewHelper
//{
//    self.viewHelper = viewHelper;
//}
//
//- (void)setBusiness:(DXBusinessHelper *)bus
//{
//    self.business = bus;
//}
//
//- (DXBusinessHelper *)business
//{
//    return self.business;
//}

@end
