//
//  NSError+LTWeb.h
//  PandaShop
//
//  Created by songlin on 29/12/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const LTBizErrorDomain;//业务异常
extern NSString * const LTWebErrorDomain;//网络异常
extern NSString * const LTUnkErrorDomain;//未知异常
typedef NS_ENUM(NSInteger,LTBizErrorCode){
    LTBizErrorCodeFailed = -1
};

@interface NSError (LTWeb)

+ (instancetype)sl_bizErrorWithCode:(LTBizErrorCode)code message:(NSString *)message;
+ (instancetype)sl_convertError:(NSError *)error;
+ (instancetype)sl_errorWithCode:(NSString *)code message:(NSString *)message;

@end
