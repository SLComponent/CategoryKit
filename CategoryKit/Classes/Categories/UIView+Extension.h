//
//  UIView+Extension.h
//  PandaShop
//
//  Created by songlin on 7/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLCircleLoadView;
@class SLErrorLoadView;

@interface UIView (Extension)



+ (id) creatFromNib;
+ (id) creatFromNibWithTarget:(id)target;

- (void) showInWindow;

- (UIViewController *) parentVC;

// 是不是某个控
- (BOOL)isSubContentOf:(UIView *)aSuperView;

- (CGRect)relativePositionTo:(UIView *)aSuperView;

- (void) configInterface;
- (void)setupInterface;
- (void)setupConstraint;
- (void)setupInterfaceData;


/**
 显示圆点动画
 
 @param view <#view description#>
 */
- (void)showCircleLoadingInView:(UIView *)view;
//
///**
// 显示网络加载失败图
//
// @param view <#view description#>
// */
- (void)showFailureView:(UIView *)view;
//
///**
// 隐藏动画
// */
- (void)hideLoadView;
//
//
@property (nonatomic, strong) SLCircleLoadView *circleView;
//
@property (nonatomic, strong) SLErrorLoadView *errorView;



@end
