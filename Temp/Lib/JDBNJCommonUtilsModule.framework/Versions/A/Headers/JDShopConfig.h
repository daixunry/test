//
//  JDShopConfig.h
//  JD4iPhone
//
//  Created by ge on 15/4/1.
//  Copyright (c) 2015年 360buy. All rights reserved.
//

#ifndef JD4iPhone_JDShopConfig_h
#define JD4iPhone_JDShopConfig_h

typedef enum
{
    TEMPLATEID_16 =16,//单个活动图
    TEMPLATEID_83 =83,//单个活动图，大图
    TEMPLATEID_84 =84,//三个活动
    TEMPLATEID_17 =17,//两个活动图
    TEMPLATEID_18 =18,//四个活动
    TEMPLATEID_73 =73,//新品上架
    TEMPLATEID_74 =74,//热卖商品
    TEMPLATEID_19 =19,
    TEMPLATEID_53 =53,//商品推荐
    TEMPLATEID_6  =6, //自由布局2
    TEMPLATEID_8  =8, //自由布局左二右一
    TEMPLATEID_7  =7, //自由布局上二下一
    TEMPLATEID_9  =9, //自由布局上一下三
    TEMPLATEID_20 =20,//全部商品
    TEMPLATEID_82 =82,//文字模版
    TEMPLATEID_11 =11,//轮播图
    TEMPLATEID_92 =92,//底部菜单栏
    TEMPLATEID_91 =91,//自由布局8格
    TEMPLATEID_131 =131,//店铺秒杀
    TEMPLATEID_132 =132,  //热区楼层
    TEMPLATEID_133 = 133, //视频楼层，直播也是这个类型的楼层，通过数据区分
}JD_SHOP_TEMPLATEID;;

typedef enum
{
    ALL_WARE_ONE_CELL =1, //4.0版本，全部商品只做一行
    ALL_WARE_BOTTOM_VIEW = 0,//上滑显示全部商品，向上推出展示
    ALL_WARE_ALL_CELL = 2,//无需推出、直接展示
    
}ALL_WARE_CONFIG_TYPE;

typedef enum
{
    kCoupon_Control_Result_Invalid = -1,    // 未调用领券是否需要验证码的接口
    kCoupon_Control_Result_False = 0,       // 需要验证码
    kCoupon_Control_Result_True = 1         // 不需要验证码
} Coupon_Control_Result;

typedef NS_ENUM(NSInteger, Shop_Coupon_Status)
{
    kShop_Coupon_Status_Inital = 0,   // 初始值，无效值
    kShop_Coupon_Status_Taked = 1,   // 已领取
    kShop_Coupon_Status_Invalid = 2, // 已失效
    kShop_Coupon_Status_Over = 3,    // 已抢完
};

typedef NS_ENUM(NSInteger, Shop_Video_Screen_Type)
{
    kShop_Video_Screen_Type_Portrait = 0,   // 竖屏
    kShop_Video_Screen_Type_LandScape = 1,  // 横屏
};

#endif
