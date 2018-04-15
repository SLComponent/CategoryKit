//
//  UIImageView+Extension.m
//  PandaShop
//
//  Created by songlin on 3/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)

+(instancetype)createImageVWithFrame:(CGRect)frame imageName:(NSString *)imageName {
    UIImageView *imageV = [[UIImageView alloc ]initWithFrame:frame];
    imageV.image = [UIImage imageNamed:imageName];
    return imageV;
}

//+(instancetype)createImageWithFrame:(CGRect)frame rColor:(CGFloat)rColor gColor:(CGFloat)gColor bColor:(CGFloat)bColor alpah:(CGFloat)alpha{
//    UIImageView *imageV = [[UIImageView alloc]initWithFrame:frame];
//    
//    return imageV;
//}

@end
