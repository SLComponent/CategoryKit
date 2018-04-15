//
//  NSError+LTWeb.m
//  PandaShop
//
//  Created by songlin on 29/12/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "NSError+LTWeb.h"

NSString * const LTWebErrorDomain = @"com.camel.panda.weberror";
NSString * const LTBizErrorDomain = @"com.camle.panda.bizerror";
NSString * const LTUnkErrorDomain = @"com.camel.panda.unkerror";
NSString * const LTJsonErrorDomain = @"com.came.panda.jsonerror";

@implementation NSError (LTWeb)

+ (instancetype)sl_bizErrorWithCode:(LTBizErrorCode)code message:(NSString *)message {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : message == nil ? @"未知异常" : message};
    return [[NSError alloc] initWithDomain:LTBizErrorDomain code:code userInfo:userInfo];
}
+ (instancetype)sl_errorWithCode:(NSString *)code message:(NSString *)message{
    NSDictionary *userInfo = [[NSDictionary alloc]init];;
    if([code isEqualToString:@"access_token_is_not_set_in_request_header"]){
        userInfo = @{NSLocalizedDescriptionKey : message == nil ? @"未知异常" : @"请重新登陆"};
    }
userInfo = @{NSLocalizedDescriptionKey : message == nil ? @"未知异常" : message};
    return [[NSError alloc] initWithDomain:LTBizErrorDomain code:[code integerValue] userInfo:userInfo];
}

+(instancetype)sl_convertError:(NSError *)error {
    NSString *domain = error.domain;
    if ([domain isEqualToString:LTBizErrorDomain] || [domain isEqualToString:LTWebErrorDomain] || [domain isEqualToString:LTUnkErrorDomain]) {
        return  error;
    }else if ([domain isEqualToString:NSURLErrorDomain]){
        return [self convertJsonError:error];
    }else {
        return [self convertUnkError:error];
    }
}

+(instancetype)convertUnkError:(NSError *)error {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:@"未知异常",NSUnderlyingErrorKey:error};
    return [[NSError alloc]initWithDomain:LTUnkErrorDomain code:error.code userInfo:userInfo];
}
+(instancetype)convertURLError:(NSError *)error {
    NSString *message;
    switch (error.code) {
        case NSURLErrorTimedOut:
            message = @"连接超时";
            break;
        case NSURLErrorNotConnectedToInternet:
            message = @"网络不可用";
            break;
            
        default:
            message = @"网络不给力";
            break;
    }
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : message,NSUnderlyingErrorKey : error};
    return [[NSError alloc]initWithDomain:LTWebErrorDomain code:error.code userInfo:userInfo];
}

+(instancetype)convertJsonError:(NSError *)error {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : @"未知异常",NSUnderlyingErrorKey : error};
    return [[NSError alloc]initWithDomain:LTJsonErrorDomain code:error.code userInfo:userInfo];
}
@end
