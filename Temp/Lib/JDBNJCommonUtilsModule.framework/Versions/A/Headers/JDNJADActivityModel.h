//
//  ADActivityModel.h
//  JD4iPhone
//
//  Created by JerryChen on 12-6-27.
//  Copyright (c) 2012年 360buy. All rights reserved.
//



typedef enum
{
    JDNJActivityType_WareList = 0, // 0 单列或者双列
    JDNJActivityType_PromotionList = 1,
    JDNJActivityType_M  = 2,
    JDNJActivityType_LandPage  = 3,
    JDNJActivityType_Game  = 4,
    JDNJActivityType_Appstore = 5,
}JDNJActivityType;
//备注  type  0  商品列表  1  促销大卖场   2  跳转m 例如虚拟页  3 跳转到落地页  4 游戏   5 AppStore


@interface JDNJADActivityModel : JDModel

// 活动ID
@property (nonatomic, copy) NSString*   activityId;

// 广告图片
@property (nonatomic, copy) NSString*   activityImage;

@property (nonatomic, assign) JDNJActivityType type;

// 1为双列带Banner   2为双列不带Banner  其他为单列
@property (nonatomic, assign) int wareDisplayType;

@property (nonatomic, copy) NSString* actionURL;

@property (nonatomic,copy) NSString* sourceValue;

// 跳转Appstore 参数
@property (nonatomic, copy) NSDictionary* param;
// 跳转Appstore  viewType = @"appstore"
@property (nonatomic, copy) NSString* viewType;

/**
 *  M页是否显示分享入口（1为需要分享入口）
 */
@property (nonatomic, copy) NSNumber *mPageShare;

/**
 *  活动标题
 */
@property (nonatomic, copy) NSString *title;
//jshop4
@property (nonatomic, copy) NSString *productId;

//店铺id
@property (nonatomic, copy) NSString *shopId;
//活动链接
@property (nonatomic, copy) NSString *detailUrl;
@property (nonatomic, assign)int jumpType;

@property (nonatomic, copy) NSString *shareTitle;
@property (nonatomic, copy) NSString *shareContent;
@property (nonatomic, copy) NSString *shareAvatar;
@property (nonatomic, copy) NSString *shareUrl;

//上报广告数据
@property (nonatomic, copy) NSString *clickUrl;
@end
