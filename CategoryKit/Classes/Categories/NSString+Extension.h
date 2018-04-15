//
//  NSString+Extension.h
//  PandaShop
//
//  Created by songlin on 7/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

-(CGSize) getStringSizeWithFont:(UIFont *) strFont andMaxSize:(CGSize) maxSize;

+ (CGSize)lableHeightWithString:(NSString *)str font:(NSInteger)font maxSize:(CGSize)size;

-(BOOL)isValid;

- (NSString *)removeWhiteSpacesFromString;

- (NSString *)substringWithPattern:(NSString *)pattern ;


/**
 验证手机号是否符合

 @param content 验证的号码
 @return YES 说明手机号正确，NO不正确
 */
+ (BOOL)checkPhone:(NSString *)content;

/**
 检查字符串是否为nil

 @param string 验证的字符串
 @return YES 说明是nil，NO不为nil
 */
+(BOOL)isEmptyStr:(NSString *)string;


/**
 将数组按照，分隔开，因为项目中目前只用到，分隔，要是以后有了，可以多加一个字段

 @param dict 属性字典
 @return <#return value description#>
 */
+(NSString *)fetchAttrStringWithDict:(NSDictionary *)dict;


/**
 md5 加密

 @return <#return value description#>
 */
- (NSString *)sl_md5Str;


/**
 内容隐藏

 @param content 要隐藏的内容
 @type 类型
 隐藏规则如下：
 规则一：
 手机号：前三后四，中间隐藏 15013339531 格式为150****9531
 规则二：
 微信号，QQ，微博，微信钱包:
 1.当1<=content<2,则不隐藏
 2.2<=content<6，则显示首字符，后面隐藏，如f****
 3.当content>=6，则显示前2后2，中间隐藏，如fo**est
 规则三:
 支付宝:
 1.当账号为手机号，和手机号的规则一样
 2.当账号为邮箱，则邮箱后缀全部显示，邮箱前缀和规则二一样,如1234@foxmail.com,格式为1***@foxmail.com，如果是1234567@foxmail.com，格式为12***67@foxmail.com
 @return <#return value description#>
 */
+(NSString *)hideStartWithContent:(NSString *)content type:(NSString *)type;


/**
 字符串拼接

 @param str1 第一个字符串
 @param str2 第二个字符串
 @return 返回拼接字符串
 */
+ (NSString *)appendStr1:(NSString *)str1 str2:(NSString *)str2;

//是否是电话号码
+(BOOL)isMobilePhone:(NSString *)phoneNum;

//是否是移动号码
+(BOOL)isCMMobilePhone:(NSString *)phoneNum;

//是否是联通号
+(BOOL)isCUMobilePhone:(NSString *)phoneNum;
//是否是电信号
+(BOOL)isCTMobilePhone:(NSString *)phoneNum;
//18位身份证格式和合法性验证
+(BOOL)checkUserID:(NSString *)userID;
//车牌号格式校验
+(BOOL)checkCarID:(NSString *)carID;
//6~16位数字/字母/下划线组成的密码格式校验
+(BOOL)checkPsw:(NSString *)pswStr;
//判断字符串是否全为[(数字)OR(数字|字母)OR(字母)OR(汉字)]
+(BOOL)isAllNumber:(NSString *)string;
//银行卡格式验证
+(BOOL)isBankCard:(NSString *)bankCard;
//邮箱格式验证
+(BOOL)isEmail:(NSString *)email;
@end
