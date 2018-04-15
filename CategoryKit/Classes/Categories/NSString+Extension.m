//
//  NSString+Extension.m
//  PandaShop
//
//  Created by songlin on 7/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "NSString+Extension.h"
#import "NetWorkMacro.h"
#import "LTConstant.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (Extension)

-(CGSize) getStringSizeWithFont:(UIFont *) strFont andMaxSize:(CGSize) maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : strFont};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (CGSize)lableHeightWithString:(NSString *)str font:(NSInteger)font maxSize:(CGSize)size
{
    UIFont *tfont = [UIFont systemFontOfSize:font];
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    
    CGSize sizeText = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return sizeText;
}

+(BOOL)isEmptyStr:(NSString *)string {
    
    
    if (string == nil || string == NULL || [string isKindOfClass:[NSNull class]]) {
        return YES;}
    if ([string isKindOfClass:[NSString class]]) {
        if ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
            return YES;
        }
    }
    
    
    return NO;
}
+(BOOL)checkPhone:(NSString *)content {
    NSString *mobile = @"^1(3|4|5|7|8)[0-9]\\d{8}$";
    
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    BOOL res = [regexMobile evaluateWithObject:content];
    if (res) {
        return YES;
    }
    
    return NO;
}

-(BOOL)isValid
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

// remove white spaces from String
- (NSString *)removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

-(NSString *)substringWithPattern:(NSString *)pattern {
        NSString *result = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *matches = [regex matchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
        for (NSTextCheckingResult *match in matches){
            NSRange range = [match rangeAtIndex:1];
            result = [self substringWithRange:range];
            break;
        }
        
        return result;
    
}


+(NSString *)fetchAttrStringWithDict:(NSDictionary *)dict {
    NSString *attrStr = @"";
    NSArray *array = [dict allKeys];
    array = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedAscending;
    }];
    for (NSString *key in array) {
      attrStr =  [attrStr stringByAppendingString:[NSString stringWithFormat:@"%@%@",dict[key],@","]];
    }
    if (attrStr.length > 0) {
        attrStr = [attrStr substringToIndex:attrStr.length - 1];
    }
    
    return attrStr;

}

- (NSString *)sl_md5Str {
    NSData *utf8data = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5([utf8data bytes], (unsigned int)[utf8data length], digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}
//隐藏规则如下：
//规则一：
//手机号：前三后四，中间隐藏 15013339531 格式为150****9531
//规则二：
//微信号，QQ，微博，微信钱包:
//1.当1<=content<2,则不隐藏
//2.2<=content<6，则显示首字符，后面隐藏，如f****
//3.当content>=6，则显示前2后2，中间隐藏，如fo**est
//规则三:
//支付宝:
//1.当账号为手机号，和手机号的规则一样
//2.当账号为邮箱，则邮箱后缀全部显示，邮箱前缀和规则二一样,如1234@foxmail.com,格式为1***@foxmail.com，如果是1234567@foxmail.com，格式为12***67@foxmail.com

+(NSString *)hideStartWithContent:(NSString *)content type:(NSString *)type {
    NSString * str = content;
    if (!(str.length > 0)) {
        return @"";
    }
    if ([type isEqualToString:kBindMobile]) {
        NSString *top3 = [content substringToIndex:3];
        NSString *bottom4 = [content substringFromIndex:7];
        str = [NSString stringWithFormat:@"%@****%@",top3,bottom4];
    }else if ([type isEqualToString:kBindWX]){
        if(content.length < 2 && content.length >= 1) str = content;
        if (content.length >= 2 && content.length < 6) {
            NSString *top1 = [content substringToIndex:0];
            for (int i = 0; i < content.length; i++) {
                str = [top1 stringByAppendingString:@"*"];
            }
        }
        if (content.length >= 6) {
            NSString *top2 = [content substringToIndex:2];
            str = top2;
            NSString *bottom2 = [content substringFromIndex:content.length - 2];
            for (int i = 0; i < content.length - 4; i++) {
                str = [str stringByAppendingString:@"*"];
            }
            str = [str stringByAppendingString:bottom2];
        }
    }
    
    return str;
}


+(NSString *)appendStr1:(NSString *)str1 str2:(NSString *)str2 {
    NSString *content = str1;
    if (str2.length > 0) {
        content = [[content stringByAppendingString:@","] stringByAppendingString:str2];
    }
    return content;
}
/**
 手机号码 13[0-9],14[5|7|9],15[0-3],15[5-9],17[0|1|3|5|6|8],18[0-9]
 移动：134[0-8],13[5-9],147,15[0-2],15[7-9],178,18[2-4],18[7-8]
 联通：13[0-2],145,15[5-6],17[5-6],18[5-6]
 电信：133,1349,149,153,173,177,180,181,189
 虚拟运营商: 170[0-2]电信  170[3|5|6]移动 170[4|7|8|9],171 联通
 上网卡又称数据卡，14号段为上网卡专属号段，中国联通上网卡号段为145，中国移动上网卡号段为147，中国电信上网卡号段为149
 */
+(BOOL)isMobilePhone:(NSString *)phoneNum
{
    NSString * MOBIL = @"^1(3[0-9]|4[579]|5[0-35-9]|7[01356]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    if ([regextestmobile evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}

/**
 *  是否是移动号
 * 中国移动：China Mobile
 * 134[0-8],13[5-9],147,15[0-2],15[7-9],170[3|5|6],178,18[2-4],18[7-8]
 */
+(BOOL)isCMMobilePhone:(NSString *)phoneNum
{
    NSString * CM = @"^1(34[0-8]|70[356]|(3[5-9]|4[7]|5[0-27-9]|7[8]|8[2-47-8])\\d)\\d{7}$";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    if ([regextestcm evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}

/**
 *  是否是联通号
 * 中国联通：China Unicom
 * 13[0-2],145,15[5-6],17[5-6],18[5-6],170[4|7|8|9],171
 */
+(BOOL)isCUMobilePhone:(NSString *)phoneNum
{
    NSString * CU = @"^1(70[07-9]|(3[0-2]|4[5]|5[5-6]|7[15-6]|8[5-6])\\d)\\d{7}$";
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    if ([regextestcu evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}

/**
 *  是否是电信号
 * 中国电信：China Telecom
 * 133,1349,149,153,173,177,180,181,189,170[0-2]
 */
+(BOOL)isCTMobilePhone:(NSString *)phoneNum
{
    NSString * CT = @"^1(34[9]|70[0-2]|(3[3]|4[9]|5[3]|7[37]|8[019])\\d)\\d{7}$";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if ([regextestct evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}
+(BOOL)checkUserID:(NSString *)userID
{
    //长度不为18的都排除掉
    if (userID.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
}


+(BOOL)checkCarID:(NSString *)carID;
{
    if (carID.length!=7) {
        return NO;
    }
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-zA-HJ-Z]{1}[a-hj-zA-HJ-Z_0-9]{4}[a-hj-zA-HJ-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carID];
    
    return YES;
}

#pragma mark    核对密码格式,6~16位数字/字母/下划线
+(BOOL)checkPsw:(NSString *)pswStr
{
    NSString * pattern  =   @"^[A-Za-z0-9_]{6,16}$";
    //    NSString *condition =@"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}";
    NSPredicate * pred  =   [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    return [pred evaluateWithObject:pswStr];
}

+(BOOL)isAllNumber:(NSString *)string
{
    NSString *condition = @"^[0-9]*$";//是否都是数字
    //    NSString *condition = @"^[A-Za-z]+$";//是否都是字母
    //    NSString *condition = @"^[A-Za-z0-9]+$";//是否都是字母和数字{6,16}
    //    NSString *condition = @"^[A-Za-z0-9]{6,16}$";//是否都是字母和数字且长度在[6,16]
    //    NSString *condition = @"^[\u4e00-\u9fa5]{0,}$";//只能输入汉字
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",condition];
    return [predicate evaluateWithObject:string];
}

//银行卡验证
+(BOOL)isBankCard:(NSString *)bankCard
{
    if (bankCard.length < 16) {
        return NO;
    }
    NSInteger oddsum = 0;     //奇数求和
    NSInteger evensum = 0;    //偶数求和
    NSInteger allsum = 0;
    NSInteger cardNoLength = (NSInteger)[bankCard length];
    // 取了最后一位数
    NSInteger lastNum = [[bankCard substringFromIndex:cardNoLength-1] intValue];
    //测试的是除了最后一位数外的其他数字
    bankCard = [bankCard substringToIndex:cardNoLength - 1];
    for (NSInteger i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [bankCard substringWithRange:NSMakeRange(i-1, 1)];
        NSInteger tmpVal = [tmpString integerValue];
        if (cardNoLength % 2 ==1 ) {//卡号位数为奇数
            if((i % 2) == 0){//偶数位置
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{//奇数位置
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

//验证邮箱地址
+(BOOL)isEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
