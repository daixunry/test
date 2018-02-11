//
//  NSObject+JDProperty.h
//  JD4iPhone
//
//  Created by ge on 15/4/3.
//  Copyright (c) 2015年 360buy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(JDProperty)

//遍历属性，包括所有的父类属性，反射自动给model赋值
- (BOOL)reflectAllDataFromOtherObject:(NSObject*)dataSource;

//遍历属性，只包含当前类属性，反射自动给model赋值
- (BOOL)reflectDataFromOtherObject:(NSObject*)dataSource;

//属性转为dic
//- (NSDictionary*)toDictionary;
@end
