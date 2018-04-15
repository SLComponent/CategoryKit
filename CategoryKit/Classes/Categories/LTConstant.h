//
//  LTConstant.h
//  PandaShop
//
//  Created by songlin on 20/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTConstant : NSObject


#pragma mark order 相关
//立即付款
FOUNDATION_EXPORT NSString * const kOrderPayMoneyStr;
//取消订单
FOUNDATION_EXPORT NSString * const kOrderCancelStr;
//查看物流
FOUNDATION_EXPORT NSString * const kOrderCheckLogistics;
//交易成功
FOUNDATION_EXPORT NSString * const kOrderCompleteStr;
//待付款
FOUNDATION_EXPORT NSString * const kOrderWaitForPay;
//待发货
FOUNDATION_EXPORT NSString * const kOrderWaitForDeliver;
//待收货
FOUNDATION_EXPORT NSString * const kOrderWaitForReceiver;
//已关闭
FOUNDATION_EXPORT NSString * const kOrderClosed;
//交易成功
FOUNDATION_EXPORT NSString * const kOrderComplete;
//订单状态
FOUNDATION_EXPORT NSString * const kOrderStatus;

//分类选项
FOUNDATION_EXPORT NSString * const kCategoryIndex;
//二级分类ID
FOUNDATION_EXPORT NSString * const kCategorySecondId;
//一级分类ID
FOUNDATION_EXPORT NSString * const kCategoryFirstId;
//组标题
FOUNDATION_EXPORT NSString * const kSectionTitles;
//订单id
FOUNDATION_EXPORT NSString * const kOrderID;

//订单操作
FOUNDATION_EXPORT NSString * const kOrderAction;

FOUNDATION_EXPORT NSString * const kTableView;
FOUNDATION_EXPORT NSString * const kCollectionView;
FOUNDATION_EXPORT NSString * const kPopView;
//取消订单
FOUNDATION_EXPORT NSString * const kCancelOrder;
//付款
FOUNDATION_EXPORT NSString * const kPayOrder;
//查看物流
FOUNDATION_EXPORT NSString * const kCheckLogistic;
//收货
FOUNDATION_EXPORT NSString * const kReceiveOrder;

FOUNDATION_EXPORT NSString * const kHomePage;

FOUNDATION_EXPORT NSString * const kHomeMember;

FOUNDATION_EXPORT NSString * const kBuyMember;


FOUNDATION_EXPORT NSString * const kItemShare;
FOUNDATION_EXPORT NSString * const kShopShare;
FOUNDATION_EXPORT NSString * const kItemDelete;


FOUNDATION_EXPORT NSString * const kCollectionGood;
//取消订单
FOUNDATION_EXPORT NSString * const kDeleteOrder;

FOUNDATION_EXPORT NSString * const kCheckOrder;

//页面操作
FOUNDATION_EXPORT NSString * const kPageAction;
FOUNDATION_EXPORT NSString * const kPageUrl;

FOUNDATION_EXPORT NSString * const kNextChange;

//推荐产品
FOUNDATION_EXPORT NSString * const kRecommend;

//活动轮播图
FOUNDATION_EXPORT NSString * const kEventBanner;
FOUNDATION_EXPORT NSString * const kEventBannerType;

//header 轮播图
FOUNDATION_EXPORT NSString * const kHeaderBanner;

//更改手机号时候的验证码
FOUNDATION_EXPORT NSString * const kToken;

//menu
FOUNDATION_EXPORT NSString * const kMenu;

//商品详情页
FOUNDATION_EXPORT NSString * const kProductInfo;

FOUNDATION_EXPORT NSString * const kViewModel;

//模型
FOUNDATION_EXPORT NSString * const kModel;

//昵称
FOUNDATION_EXPORT NSString * const kNickname;
//密码
FOUNDATION_EXPORT NSString * const kPassword;

//搜索热词
FOUNDATION_EXPORT NSString * const kKeyWord;

//删除收藏
FOUNDATION_EXPORT NSString * const kDeleteCollectionGoods;
//收藏
FOUNDATION_EXPORT NSString * const kCollectionGoods;
//收藏操作
FOUNDATION_EXPORT NSString * const kCollectionOperation;
//购物车id
FOUNDATION_EXPORT NSString * const kShopId;
//goods id
FOUNDATION_EXPORT NSString * const kGoodsId;
//是否已经加入商店了
FOUNDATION_EXPORT NSString * const kJoinStatus;
//商品数目
FOUNDATION_EXPORT NSString * const kGoodsNum;
//地址id
FOUNDATION_EXPORT NSString * const kAddressId;
//属性
FOUNDATION_EXPORT NSString * const kAttrValue;
//setting
FOUNDATION_EXPORT NSString * const kSetting;
//kClearCache
FOUNDATION_EXPORT NSString * const kClearCache;
//关于我们
FOUNDATION_EXPORT NSString * const kAboutUS;
//账号安全
FOUNDATION_EXPORT NSString * const kAccountSave;
FOUNDATION_EXPORT NSString * const kWithDraw;
//刷新操作
FOUNDATION_EXPORT NSString * const kRefreshOperation;
FOUNDATION_EXPORT NSString * const kShopCartListFooterRefresh;
FOUNDATION_EXPORT NSString * const kShopCartRemmendFooterRefresh;
FOUNDATION_EXPORT NSString * const kShopCartRemmendHeaderRefresh;
FOUNDATION_EXPORT NSString * const kShopCartListHeaderRefresh;
FOUNDATION_EXPORT NSString * const kIndexPath;
FOUNDATION_EXPORT NSString * const kDataSource;


FOUNDATION_EXPORT NSString * const kDetailAddress;
FOUNDATION_EXPORT NSString * const kProvinceCode;
FOUNDATION_EXPORT NSString * const kCityCode;
FOUNDATION_EXPORT NSString * const kAreaCode;

//购物车cell点击
FOUNDATION_EXPORT NSString * const kShopCartCellAction;


//提交订单
FOUNDATION_EXPORT NSString * const kSubmitOrderSuccessfulNotification;
//微信支付
FOUNDATION_EXPORT NSString * const kWXPayNotification;
FOUNDATION_EXPORT NSString * const kWXPaySuccessNotification;
FOUNDATION_EXPORT NSString * const kWXPayFailureNotification;

//支付宝支付
FOUNDATION_EXPORT NSString * const kALIPayNotification;
FOUNDATION_EXPORT NSString * const kAlipayWalletNotification;
FOUNDATION_EXPORT NSString * const kALIPaySuccessNotification;
FOUNDATION_EXPORT NSString * const kALIPayFailureNotification;



//标题
FOUNDATION_EXPORT NSString * const kTitle;

//textAligment
FOUNDATION_EXPORT NSString * const kTextAlignment;
FOUNDATION_EXPORT NSString * const kBackColor;

//account save
FOUNDATION_EXPORT NSString * const kOperation;
FOUNDATION_EXPORT NSString * const kBindMobile;
FOUNDATION_EXPORT NSString * const kBindWX;
FOUNDATION_EXPORT NSString * const kBindQQ;
FOUNDATION_EXPORT NSString * const kBindWB;
FOUNDATION_EXPORT NSString * const kBindPassword;

FOUNDATION_EXPORT NSString * const kWexin;
FOUNDATION_EXPORT NSString * const kWeiBo;
FOUNDATION_EXPORT NSString * const kQQ;
//弹出框类型
FOUNDATION_EXPORT NSString * const kPopType;

FOUNDATION_EXPORT NSString * const kView;
FOUNDATION_EXPORT NSString * const kViewController;

//付款状态
FOUNDATION_EXPORT NSString * const kPayState;


//没有更多的数据啦!
FOUNDATION_EXPORT NSString * const kNoMoreData;
FOUNDATION_EXPORT NSString * const kNoMoreIdentifier;

@end
