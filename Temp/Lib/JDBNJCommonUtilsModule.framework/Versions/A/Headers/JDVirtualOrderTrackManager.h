//
//  JDVirtualOrderTrackManager.h
//  JD4iPhone
//
//  Created by wangyabo on 15/6/24.
//  Copyright (c) 2015年 360buy. All rights reserved.
//

#ifndef JD4iPhone_JDVirtualOrderTrackManager_h
#define JD4iPhone_JDVirtualOrderTrackManager_h

/**
 *  订单提交成功
 */
#define VIRTUAL_ORDER_SUBMIT_SUCCESS        @"virtual_order_submit_success"

#define ORDER_TRACK_TYPE_CHARGE            @"virtual_charge"      //话费order
#define ORDER_TRACK_TYPE_MOVIE             @"virtual_movie"       //电影票order
#define ORDER_TRACK_TYPE_TICKET             @"virtual_ticket"       //演出票order
#define ORDER_TRACK_TYPE_AIRTICKET         @"virtual_airticket_domestic"   //国内机票order
#define ORDER_TRACK_TYPE_INTER_AIRTICKET   @"virtual_airticket_international"   //国内机票order
#define ORDER_TRACK_TYPE_DATA_CHARGE       @"virtual_datacharge"      //流量充值order
#define ORDER_TRACK_TYPE_QQ_CHARGE         @"virtual_qqcharge"          //QQ充值order
#define ORDER_TRACK_TYPE_GAME_CHARGE       @"virtual_gamecharge"      //游戏充值order
#define ORDER_TRACK_TYPE_QQGAME_CHARGE     @"virtual_qqgamechargepage" //QQ游戏点卡独立充值order

#endif
