//
//  AppMacro.h
//  PandaShop
//  本类放app相关的宏定义
//  Created by songlin on 4/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h


//apiVersion
#define kVersion @"v1"

//服务器开关 1 代表测试 0 代表正式
#define TESTSTYLE 1


#if TESTSTYLE

#define kApiRequest @"https://xiongmao.camel.com.cn/api"
//#define kApiRequest @"http://www.ngrok.xiaomiqiu.cn/api"
//#define kApiRequest @"https://www.baidu.com"
#else

#define kApiRequest @"https://xiongmao.camel.com.cn/api"

#endif



#define kApiImage   @"https://xiongmao.camel.com.cn"

#define REQUEST_URL  [NSString stringWithFormat:@"%@/%@",kApiRequest,kVersion]

#define wxAuth_URL @"https://api.weixin.qq.com"
#define kWXOauth    @"sns/oauth2/access_token"
#define kWXUserInfo @"sns/userinfo"

#define WXAPPKey @"wx00271750fc6d9341"
#define WXAPPSecret @"0782fc50d31162dd473822f2ab72c07c"
#define WXGRANT_TYPE @"authorization_code"



//接口返回字段
#define kResponseCode @"code"
#define kResponseMsg @"msg"
#define kResponseTime @"time"
#define kResponseData @"data"
#define kResponseAccesstoken @"access_token"
#define kResponseExpireTime @"expire_in"
#define kResponseCate @"cate"
#define kResponseList @"list"


//===========首页接口==========start

/**
 轮播图url
0：代表首页的轮播图；1：代表新品页面的轮播图；2：代表热卖页面的轮播图
 */
#define kBanner @"home/banner"

//新品速递
#define kHomeNews @"home/news"

// 人气热销
#define kHomeHot @"home/hot?"
// 推荐分类
#define kHomeCategory @"home/category"
 //为你精选
#define kHomeRecommend @"home/recommend"
//二级分类头部标题
#define kCategorySecondTitle @"home/cate"
//二级分类列表
#define kCategorySecondList @"home/goods_list"
//tabbar 分类左侧接口
#define kCategoryLeftList @"home/cate_list"
#define kCategoryRightList @"home/child_list"
//首页搜索
#define kSearchWord @"home/search"
//单品收藏
#define kCollectionSingle   @"favo"
//商品详情
#define kProductDetail  @"goods/getInfo"

//===========首页接口==========end


//===========购物车接口==========start
//购物车列表
#define kShopCartList   @"cart"
//购物车推荐
#define kShopCartRecommend  @"goods/recommend"
//提交订单---经过购物车
#define kShopCartSubmitOrder @"goods_order"
//提交订单--不经过购物车
#define kDetailPageSubmitOrder  @"goods_order/purchase_immediately"
//立即购买
#define kShopCartPurchaseImmediately @"goods/balance"
#define kShopCartDelete @"cart"
//订单详情
#define kShopCartOrderDetail    @"cart/getCartSum"
//购物车数目增加减
#define kShopCartOrderAdd   @"cart/add"
//商品属性
#define kShopAttr   @"goods/getSpec"
//获取商品属性
#define kShopChangeAttr @"sku/getNumByAttr"
//获取购物车数量
#define kShopChangeNum  @"cart/getTotal"
//支付订单
#define kPayOrderUrl @"goods_order"
//===========购物车接口==========end



//===========我的接口==========start
//用户登录验证
#define kLoginAuth @"auth/login"
//手机验证
#define kMobileAuth @"passport/mobile/verify"
//手机注册
#define kMobileRegister @"passport/mobile/reg"
//重置密码
#define kGetOrAuthMsgCode    @"passport/get_pass"
#define kRestPassword   @"passport/set_pass"
//我的商品收藏列表
#define kCollectionList @"account/favo_goods"
//个人资料
#define kUserInfo @"account/info"
//地址列表
#define kAddress  @"address"
//数据字典
#define kAddressArea  @"other/area"
//订单列表
#define kOrder  @"goods_order"
//取消或确认订单
#define kOrderOperation @"goods_order/order_status"
//物流信息
#define kLogistic @"goods_order/get_logistics"
//问题列表
#define kQuestion @"faq"
//检查手机是否可以注册，并获取验证码
#define kMsgCode @"account/mobile/verify"
//获取验证码
#define kFetchMsgCode @"other/mobile/verify_code"
//绑定手机号
#define kMobileBind @"account/mobile/bind"
//绑定微信
#define kWXBind     @"account/weixin/bind"
//验证码登录
#define kVerifyCodeLogin    @"auth/msg_code_login"
//上传头像
#define kAvatar @"account/avatar"
//退出登录
#define kLoginout   @"auth"
//微信授权登录
#define kWXAppLogin @"auth/app_wx_login"
//立即付款
#define kPayNow @"goods_order/immediate_payment"
//账号明细
#define kAccountStatus  @"account/bind_stats"
//解绑微信
#define kUnbindWX   @"account/weixin/unbind"
//更换手机
#define kChangeMobile   @"account/mobile/change"
//设置密码
#define kSettingPassword    @"account/set_pass"
#define kSettingResetPassword   @"account/reset_pass"
//请求支付数据
#define kPayImformation @"goods_order/immediate_payment"

//===========我的接口==========end


//===========会员接口==========start
#define kSaleRecord @"commission"
//佣金收入
#define kSaveMoney @"commission/get_save_money"
//添加商品到商品
#define kAddGoodToShop  @"shop/relationGoods"
#define kShop   @"shop"
//佣金
#define kCommission @"withdrawals/get_info"
//提现记录列表
#define kDrawRecordList @"withdrawals"
//获取收益明细
#define kCommissionList @"withdrawals/commission_list"
//获取提现方式
#define kFetchWithDrawStatus @"setting_withdrawal"
//检查提现密码
#define kCheckWithDrawPassword @"setting_withdrawal/check_pwd"
//获取店铺信息
#define kFetchShopKeeperData @"shopkeeper"
//===========会员接口==========end




#endif /* AppMacro_h */
