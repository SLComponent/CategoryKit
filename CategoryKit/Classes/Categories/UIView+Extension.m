//
//  UIView+Extension.m
//  PandaShop
//
//  Created by songlin on 7/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>
#import "SLErrorLoadView.h"
#import "SLCircleLoadView.h"

#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width

@implementation UIView (Extension)

+ (id) creatFromNib{
    
    NSString *xibName = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle]loadNibNamed:xibName owner:nil options:nil] firstObject];
}

+(id)creatFromNibWithTarget:(id)target {
    NSString *xibName = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle]loadNibNamed:xibName owner:target options:nil] firstObject];
}

- (void) showInWindow{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.frame = CGRectMake(0, 0, CGRectGetWidth(window.bounds), CGRectGetHeight(window.bounds));
    
    [window addSubview:self];
}

- (UIViewController *) parentVC{
    
    id object = [self nextResponder];
    
    while (![object isKindOfClass:[UIViewController class]] && object != nil) {
        object = [object nextResponder];
    }
    
    return (UIViewController *) object;
}

- (BOOL)isSubContentOf:(UIView *)aSuperView
{
    if (self == aSuperView)
    {
        return YES;
    }
    else
    {
        return [self.superview isSubContentOf:aSuperView];
    }
}


- (CGRect)relativePositionTo:(UIView *)aSuperView
{
    BOOL isSubContentOf = [self isSubContentOf:aSuperView];
    
    while (isSubContentOf)
    {
        return [self relativeTo:aSuperView];
    }
    
    return CGRectZero;
    
}

- (CGRect)relativeTo:(UIView *)aSuperView
{
    CGPoint originPoint = CGPointZero;
    UIView *view = self;
    while (!(view == aSuperView))
    {
        originPoint.x += view.frame.origin.x;
        originPoint.y += view.frame.origin.y;
        
        if ([view isKindOfClass:[UIScrollView class]])
        {
            originPoint.x -= ((UIScrollView *) view).contentOffset.x;
            originPoint.y -= ((UIScrollView *) view).contentOffset.y;
        }
        
        view = view.superview;
    }
    
    // TODO:如果SuperView是UIWindow,需要结合Transform计算
    return CGRectMake(originPoint.x, originPoint.y, self.frame.size.width, self.frame.size.height);
}


- (void) configInterface{
    [self setupInterface];
    [self setupConstraint];
    [self setupInterfaceData];
};

- (void) setupInterface{};

- (void) setupConstraint{};

- (void) setupInterfaceData{};



-(void)hideLoadView{
    self.errorView.hidden = YES;
    self.circleView.hidden = YES;
}


-(void)showCircleLoadingInView:(UIView *)view {
    if (self.circleView == nil) {
        self.circleView = [[SLCircleLoadView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    }
    if (view) {
        [view addSubview:self.circleView];
        self.circleView.frame = view.bounds;
    }else {
        UIWindow *appKeyWindow = [UIApplication sharedApplication].keyWindow;
        [appKeyWindow addSubview:self.circleView];
        self.circleView.frame = appKeyWindow.bounds;
    }
 
    self.errorView.hidden = YES;
    self.circleView.hidden = NO;
}

- (void)showFailureView:(UIView *)view {
    if (self.errorView == nil) {
        self.errorView = [[SLErrorLoadView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    }
    if (view) {
        [view addSubview:self.errorView];
    }else {
        UIWindow *appKeyWindow = [UIApplication sharedApplication].keyWindow;
        [appKeyWindow addSubview:self.circleView];
        self.errorView.frame = appKeyWindow.bounds;
    }
    self.circleView.hidden = YES;
    self.errorView.hidden = NO;
}



-(SLCircleLoadView *)circleView {
    return objc_getAssociatedObject(self, @"loadingView");
}

-(void)setCircleView:(SLCircleLoadView *)circleView {
    objc_setAssociatedObject(self, @"loadingView", circleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(SLErrorLoadView *)errorView {
     return objc_getAssociatedObject(self, @"errorView");
}

-(void)setErrorView:(SLErrorLoadView *)errorView {
      objc_setAssociatedObject(self, @"errorView", errorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
