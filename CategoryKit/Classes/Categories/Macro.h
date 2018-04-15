//
//  Macro.h
//  OCDemo
//
//  Created by songlin on 29/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


//Marco
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define SLLog(fmt,...) NSLog((@"\n[文件名:%s]\n" "[函数名:%s]" "[行号:%d] \n" fmt),__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__);
#else
#define NSLog(...) {}
#define SLLog(...);
#endif


//TODO
#if IS_IOS_11

#define kNavHeight 96
#define kBottomHeight 80

#else

#define kNavHeight 64
#define kBottomHeight 51
#define kStatusHeight 20

#endif

//SystemVersion

#define IS_IOS_11 (NSFoundationVersionNumber>=NSFoundationVersionNumber_iOS_11_0? YES : NO)

// 系统版本浮点型
#define kSystemVersionF [[[UIDevice currentDevice] systemVersion] floatValue]
// 系统版本字符串类型
#define kSystemVersion [[UIDevice currentDevice] systemVersion]


//UIFont
#define SLFONT(fontSize) [UIFont systemFontOfSize:fontSize]

#define FONT12 SLFONT(12)
#define FONT14 SLFONT(14)



///SVP
#define SHOW_REQUEST \
[SVProgressHUD showWithStatus:@"正在加载中..."];

#define SHOW_RESPONSEERROR \
[SVProgressHUD showErrorWithStatus:@"网络连接有问题"];

#define SHOW_RESPONSESUCCESS \
[SVProgressHUD setMinimumDismissTimeInterval:1];\
[SVProgressHUD showSuccessWithStatus:@"加载成功"];

#define DISMISS \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[SVProgressHUD dismiss]; \
});



#define SHOW_SVP(title) \
[SVProgressHUD showWithStatus:title];

#define SHOW_ERROE(title) \
[SVProgressHUD showErrorWithStatus:title];

#define SHOW_SUCCESS(title) \
[SVProgressHUD showSuccessWithStatus:title];

#define DISMISS_SVP(time) \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[SVProgressHUD dismiss]; \
});

///读取用户数据完成
#define READ_USER_DATA_FINISH @"readUserDataFinish"

//NSUserDefaults
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define CURRENT_USER [LTUser currentUser]


#pragma mark - 宽高

#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
#define ZOOM_SCALL kWidth/kHeight

//图片url
#define IMG_URL @"http://www.jiuyunda.net:90"

@class UIActivityIndicatorView;

static UIActivityIndicatorView *_indicatorView;
//Show ActivityIndicator
#define ADShowActivity(superView) do { \
if (_indicatorView == nil) { \
_indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray]; \
}\
if (![_indicatorView isAnimating]){ \
[superView addSubview:_indicatorView]; \
_indicatorView.center = superView.center;\
[_indicatorView startAnimating]; \
}   \
} while(0)

//Hide ActivityIndicator
#define ADHideActivity do { \
if ([_indicatorView isAnimating]) { \
[_indicatorView stopAnimating];\
} \
} while (0)

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define ImageNamed(name) [UIImage imageNamed:name]


// 判断字段时候为空的情况
#define IF_NULL_TO_STRING(x) ([(x) isEqual:[NSNull null]]||(x)==nil)? @"":TEXT_STRING(x)
// 转换为字符串
#define TEXT_STRING(x) [NSString stringWithFormat:@"%@",x]

//URL Macro
//首页轮播图
#define HOME_HEAD @"HomeHead"
//首页热门商品
#define Home_Data @"HomeData"

///正常字体
#define H30 [UIFont systemFontOfSize:30]
#define H29 [UIFont systemFontOfSize:29]
#define H28 [UIFont systemFontOfSize:28]
#define H27 [UIFont systemFontOfSize:27]
#define H26 [UIFont systemFontOfSize:26]
#define H25 [UIFont systemFontOfSize:25]
#define H24 [UIFont systemFontOfSize:24]
#define H23 [UIFont systemFontOfSize:23]
#define H22 [UIFont systemFontOfSize:22]
#define H20 [UIFont systemFontOfSize:20]
#define H19 [UIFont systemFontOfSize:19]
#define H18 [UIFont systemFontOfSize:18]
#define H17 [UIFont systemFontOfSize:17]
#define H16 [UIFont systemFontOfSize:16]
#define H15 [UIFont systemFontOfSize:15]
#define H14 [UIFont systemFontOfSize:14]
#define H13 [UIFont systemFontOfSize:13]
#define H12 [UIFont systemFontOfSize:12]
#define H11 [UIFont systemFontOfSize:11]
#define H10 [UIFont systemFontOfSize:10]
#define H8 [UIFont systemFontOfSize:8]

///粗体
#define HB20 [UIFont boldSystemFontOfSize:20]
#define HB18 [UIFont boldSystemFontOfSize:18]
#define HB16 [UIFont boldSystemFontOfSize:16]
#define HB14 [UIFont boldSystemFontOfSize:14]
#define HB13 [UIFont boldSystemFontOfSize:13]
#define HB12 [UIFont boldSystemFontOfSize:12]
#define HB11 [UIFont boldSystemFontOfSize:11]
#define HB10 [UIFont boldSystemFontOfSize:10]
#define HB8 [UIFont boldSystemFontOfSize:8]

///常用颜色
#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
#define magenta_color   [UIColor magentaColor]

#define bgTableViewColor SLCOLOR(234, 234, 234, 1)

#define SLCOLORHex(hex) [UIColor colorWithHexString:(hex)]

#define SLCOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define BASE_COLOR SLCOLOR(243, 243, 246, 1.0)

#define BACK_COLOR SLCOLOR(240,240,240,1)


#define BASE_COLOR1 SLCOLOR(210, 210, 210, 1.0)

#define THEME_COLOR SLCOLOR(250, 98, 97, 1)

#define THEME_COLOR_ALPHA SLCOLOR(250, 98, 97, 0.99)

#define BLACK_COLOR SLCOLOR(50,50,50,1)

#define WORDS_COLOR [UIColor colorWithHex:0x5c5c5c] // 常规文字

#define LINKS_COLOR [UIColor colorWithHex:0x333333] // 链接 (深绿)

#define LINE_COLOR [UIColor colorWithHex:0xe9e9e9]  // 描线色

#define kGREEN_COLOR    SLCOLORHex(@"#81d6aa")  //app统一绿色色值
#define kBLACK_COLOR    SLCOLORHex(@"#212121")  //app统一黑色色值
#define kGRAY_COLOR     SLCOLORHex(@"969696")   //app统一灰色色值
#define kGRAY_COLOR2    SLCOLORHex(@"dcdcdc")
#define kViewBackColor  SLCOLORHex(@"f6f6f6")   //背景view统一颜色
#define kSperateViewColor  SLCOLORHex(@"f1f1f1")   

#define kHotKeys        @"hotKeys"
#define kHistoryKeys    @"historyKeys"


#define kOrderListTag 104
#define kHomePageTag 105
#define kCollectionTag 106
#define kDeleteTag 107
#define kPayTag 108
#define kVipTag 109



#endif /* Macro_h */
