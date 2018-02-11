//
//  JDShopDelegate.h
//  JDShop
//
//  Created by louhongliang on 13-12-14.
//  Copyright (c) 2013年 louhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDNJCommonDelegate <NSObject>
@optional
//联系商家
- (void)contactMerchant;
- (void)updateJDDiscountTicketViewOriginY:(NSInteger)target withView:(id)view;
//是否获取验证码
- (void)isTakeSecurityCodeDelegate:(BOOL)identify;
//从列表优惠券获取开启支付密码信息
- (void)discountTicketViewWithPayDic:(NSDictionary *)dic;
//返回首页
- (void)turnToShopHomeViewController;
//获取商家分类搜索商品
- (void)getShopCategoryProductsWithSubDic:(NSDictionary *)subDic withLevel:(NSInteger)level;
//获取商家所有分类的商品
- (void)getShopAllProducts;


//跳转登录页面
- (void)turnToLoginViewController;
//跳转到详情页,添加商品所在列表位置
- (void)turnToWareInfoViewControllerWithWareId:(NSDictionary *)productDic position:(NSInteger)pos;
//开通支付或者购物
- (void)connectPayWebView:(BOOL)pay WithPayDic:(NSDictionary *)dic;
//根据商家模板的内容调整商家店铺首页的高度
- (void)updateHomeViewSubView:(CGRect)frame;
//动态调整图片的高度
- (void)updateHeadBannerView:(CGRect)frame;
//跳转到活动页
- (void)turnToActivityWithBannerId:(NSString *)bannerId;
// ------ added by 00 at 14-01-16 ------
// 取消完了所有关注的店铺时的回调
- (void)didCancelAttentionedShopWithIndex:(NSInteger)shopIndex;
// -----------------------------------------


//店铺二期代理方法
//筛选按钮响应函数
- (void)filterResultByCondition:(NSInteger)tag select:(BOOL)select;
//在首页显示搜索视图
- (void)showSearchView:(BOOL)show;
//显示分类
- (void)showShopCategoryView;
//根据输入内容搜索结果
- (void)searchResultWithBarTxt:(NSString *)text;
//隐藏软键盘
- (void)hiddenSoftBoard:(BOOL)hidden;
//列表和方格切换
- (void)showListViewWithGridType:(BOOL)listType;
//点击店铺首页导航栏上的more按钮
- (void)showMoreOnShopHomeNavigationBar:(id)sender;
//分享到SNS或者隐藏分享视图
- (void)hiddenOrShareShopToSNS:(NSInteger)tag;
//底部关注视图状态
- (void)changeToastButState:(BOOL)follow;

- (void)turnToWebActivity:(NSDictionary *)dic;

//add 2014-06-12
- (void)updateDiscountTicketViews;
//add 2014-06-30
- (void)updateWebViewHeightByJS:(float)height;

//根据分类查看商品信息，100：全部，200：上新，300：促销
- (void)searchTypedProduct:(int)flag;

//领取额优惠券时，需要开通支付密码，add by wangyabo
- (void)needOpenPayPassword:(NSDictionary *)openDic;

// 无验证码领券，领取优惠券后的处理
- (void)finishTakeCoupon:(NSString *)couponId takeResult:(BOOL)success toastMessage:(NSString *)message;

//店铺五期
//好店铺顶部的筛选功能
- (void)willFilterProductByCategoryDic:(NSDictionary *)dic withTag:(NSInteger)tag;

//上新，促销，优惠券按钮
- (void)willClickButton:(id)sender;

//根据店铺卡片不同类型的上新，促销，优惠券，跳转到不同的页面
- (void)willDealWithShopCard:(id)model withTag:(NSInteger)tag withIndex:(NSInteger)index;

//将右侧展开的关注和忽略按钮装在数组中
- (void)willAddRightButtonToArray:(NSMutableArray *)array withView:(id)sender;

//点击右侧展开图标的时候，要删除上次的展开的图标
- (void)willDeleteRightButton;

//跳转到好店铺页面
- (void)turnToBrandViewController:(NSDictionary *)dic1 withShopInfo:(NSDictionary *)dic2 withPay:(BOOL)pay withIndex:(NSInteger)index;

//跳转到店铺详情页面
- (void)turnToShopDetailController;

//在线客服，联系商家，二维码点击事件
- (void)shopDetailBottomClick:(NSInteger)tag;

//领取好店铺列表优惠券
- (void)takeCouponWithCode:(NSInteger)tag;

//领取好店铺列表优惠券
- (void)takeCouponWithCode:(NSInteger)tag withModel:(id)model;

//关注好店铺
- (void)shiledLoginViewWithShop;

//屏蔽不喜欢店铺
- (void)willShieldUnlikeShop:(NSInteger)shopIndex login:(BOOL)login;

// 好店页面，将要去执行关注或屏蔽店铺的操作
- (void)beforFollowOrShieldShopWhenUnLogin;

//更新店铺简介视图
- (void)updateShopDetailView:(float)height
                      module:(NSString *)moduleName;

//查询公司执照
- (void)showShopCompanyLicense;

//查询公司更多品牌
- (void)showShopMoreBrands;

//好店铺优惠券列表消失动画
- (void)dismissDiscountViewWithAnimation;

//店铺页关注，取消关注
- (void)followShopInDetail:(NSString *)isFollow;

//优惠券领取中心代理方法
- (void)filterCouponsByConditons:(NSDictionary *)condition;

//优惠券列表选取优惠券
- (void)selectCouponViewWithDictionary:(NSDictionary *)dic;


//领取优惠券 add genong 2014-2-27
- (void)takeNavtiveDiscount:(NSNumber*)nIndex;
- (void)takeNavtiveMoreDiscount;

//优惠券中心三个筛选按钮
//- (void)filterCouponByCondition:(id)sender select:(BOOL)select;
- (void)filterCouponByCondition:(id)sender;
//刷新分类时候的frame
- (void)updateViewWithCategoryView;
//初始化优惠券中心的时候刷新frame
- (void)updateViewWithCoupons;
//处理所有筛选条件
- (void)dealWithCategoryFilteConditons:(NSInteger)tag withDic:(NSDictionary *)dic;
//开关代理
- (void)jdSwitchDidUpdate:(id)sender;

// categoryTagView显示或消失时需要调用的方法
- (void)showOrHideCategoryView:(BOOL)show;

//  点击排行榜中的某个排行榜分类，处理筛选.dic: 当前排行榜数据；tag：当前按钮的tag值
- (void)dealWithRankFilter:(NSDictionary *)dic withTag:(NSInteger)tag;

// 点击排行榜页面底部的某个分类。dic:当前选中的分类
- (void)queryProductInfoByCate:(NSDictionary *)dic existRedPoint:(BOOL)exist;

// 进入到店铺会员页面
- (void)pushToShopMemberView;


// 点击好店中的某个商品icon，或点击了视频
- (void)clickWareImageInGoodShop:(NSInteger)shopIndex imageTag:(NSInteger)tag;

// 下面两个是加购物车按钮的回调方法
- (void)listMenuAddCartAnimationWith:(UIImageView *)viewAnimation_;

@end
