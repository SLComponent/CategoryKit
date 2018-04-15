//
//  UIButton+Extension.h
//  PandaShop
//
//  Created by songlin on 30/03/2018.
//  Copyright © 2018 com.cn.camel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)


/**
 设置按钮的四个边缘距离

 @param top 顶部
 @param right 右边
 @param bottom 下面
 @param left 左边
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top
                         right:(CGFloat)right
                       bottom:(CGFloat)bottom
                        left:(CGFloat)left;
@end
