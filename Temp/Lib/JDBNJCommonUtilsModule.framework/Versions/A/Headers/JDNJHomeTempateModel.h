//
//  HomeTempateModel.h
//  JD4iPhone
//
//  Created by JerryChen on 13-11-21.
//  Copyright (c) 2013年 360buy. All rights reserved.
//



typedef enum
{
    JDNJTemplateItemIndex_class,
    JDNJTemplateItemIndex_frame,
    JDNJTemplateItemIndex_background,
    JDNJTemplateItemIndex_cornerRadius,
    JDNJTemplateItemIndex_borderColor,
}JDNJTemplateItemIndex;



@interface JDNJHomeTempateModel : JDModel



@property (nonatomic, retain) NSNumber *isTopLine;

@property (nonatomic, retain) NSNumber *isCenterLine;

@property (nonatomic, retain) NSNumber *isBottomLine;


/*
 子楼层内容
*/
@property (nonatomic, retain) id content;

/*
 * 楼层介绍
 */
@property (nonatomic, copy) NSString* floorIntro;


/*
 * 模板类型
 */
@property (nonatomic, copy) NSNumber* templateType;


/*
 * 参数
 */
@property (nonatomic, copy) NSDictionary* param;


/*
 * 接口functionId
 */
@property (nonatomic, copy) NSString* functionId;

/**
 *  埋点用
 */
@property (nonatomic, copy) NSString* sourceValue;


/*
 * userInfo用户信息,用于保存已经获取的数据
 */
@property (nonatomic, retain) id userInfo;
/*
 * 快捷入口所有数据
 */
@property (nonatomic, retain) NSMutableArray *allButtonItems;

/*
 *快捷入口发现更多
 */
@property (nonatomic, retain) id appCenterItem;
/*
 * badgeNumber用户信息,用于保存已经获取的数据
 */
@property (nonatomic, retain) NSNumber* badgeNumber;


/*
 * item view高度
 */
@property (nonatomic, readonly) CGFloat itemViewHeight;


/*
 * 接口functionId
 * @return 组成模板item views
 */
@property (nonatomic, readonly) NSArray * itemViews;

//个性化楼层位置 a,b,c
@property (nonatomic, copy) NSString *abTest;

/**
 *  0,没有更多，1 有更多  int
 */
@property (nonatomic, retain) NSNumber* type;

/**
 *   更多url
 */
@property (nonatomic, copy) NSString *moreUrl;
/**
 *  子类型 A:横线  B:田字格
 */
@property (nonatomic, copy) NSString *subStyle;
/**
 *   主题馆图片轮播时间间隔
 */
@property (nonatomic, retain) NSNumber* imgTime;
/**
 *   主题馆一次性轮播的数量
 */
@property (nonatomic, retain) NSNumber* imgNum;

/**
 *   主题馆更多是否分享
 */
@property (nonatomic, retain) NSNumber* ynShare;

/**
 *   用来判断数据是否发生变化
 */
@property (nonatomic, copy) NSString* md5Id;

/**
 *   缓存时间
 */
@property (nonatomic, retain) NSDate * saveTime;

/**
 *   埋点用店铺专用
 */
@property (nonatomic, copy) NSString * goodShopSource;


@end
