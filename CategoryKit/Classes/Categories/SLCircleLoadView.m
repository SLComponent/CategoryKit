//
//  SLCircleLoadView.m
//  PandaShop
//
//  Created by songlin on 2/2/2018.
//  Copyright © 2018 com.cn.camel. All rights reserved.
//

#import "SLCircleLoadView.h"
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width

static NSInteger circleCount = 4;
static CGFloat cornerRadius = 6;
static CGFloat magin = 15;

@interface SLCircleLoadView ()<CAAnimationDelegate>

@property (nonatomic, strong) NSMutableArray *layerArr;
@property (nonatomic, strong) UIImageView *logoImageV;

@end

@implementation SLCircleLoadView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
         [self configLogoImageV];
        [self drawCircles];
    }
    return self;
}
- (void)configLogoImageV {
    self.logoImageV = [[UIImageView alloc]initWithFrame:CGRectMake((kWidth - 100)/2, kHeight * 0.3 - 120, 100, 100)];
    self.logoImageV.image = [UIImage imageNamed:@"panda"];
    [self addSubview:self.logoImageV];
}
// 画圆
- (void)drawCircles{
    for (NSInteger i = 0; i < circleCount; ++i) {
        CGFloat x = (kWidth - (cornerRadius*2) * circleCount - magin * (circleCount-1)) / 2.0 + i * (cornerRadius*2 + magin) + cornerRadius;
        CGRect rect = CGRectMake(-cornerRadius, -cornerRadius , 2*cornerRadius, 2*cornerRadius);
        UIBezierPath *beizPath=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
        CAShapeLayer *layer=[CAShapeLayer layer];
        layer.path=beizPath.CGPath;
        layer.fillColor=[UIColor grayColor].CGColor;
        layer.position = CGPointMake(x, self.frame.size.height * 0.3);
        [self.layer addSublayer:layer];
        
        [self.layerArr addObject:layer];
    }
    
    [self drawAnimation:self.layerArr[0]];
    
    // 旋转(可打开试试效果)
    // CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    // rotationAnimation.toValue = [NSNumber numberWithFloat: - M_PI * 2.0 ];
    // rotationAnimation.duration = 1;
    // rotationAnimation.cumulative = YES;
    // rotationAnimation.repeatCount = MAXFLOAT;
    // [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

// 动画实现
- (void)drawAnimation:(CALayer*)layer {
    CABasicAnimation *scaleUp = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleUp.fromValue = @1;
    scaleUp.toValue = @1.5;
    scaleUp.duration = 0.25;
    scaleUp.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CABasicAnimation *scaleDown = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleDown.beginTime = scaleUp.duration;
    scaleDown.fromValue = @1.5;
    scaleDown.toValue = @1;
    scaleDown.duration = 0.25;
    scaleDown.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[scaleUp, scaleDown];
    group.repeatCount = 0;
    group.duration = scaleUp.duration + scaleDown.duration;
    group.delegate = self;
    [layer addAnimation:group forKey:@"groupAnimation"];
    
}
#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim
{
    if ([anim isKindOfClass:CAAnimationGroup.class]) {
        CAAnimationGroup *animation = (CAAnimationGroup *)anim;
        
        [self.layerArr enumerateObjectsUsingBlock:^(CAShapeLayer *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CAAnimationGroup *a0 = (CAAnimationGroup *)[obj animationForKey:@"groupAnimation"];
            if (a0 && a0 == animation) {
                CAShapeLayer *nextlayer = self.layerArr[(idx+1)>=self.layerArr.count?0:(idx+1)];
                [self performSelector:@selector(drawAnimation:) withObject:nextlayer afterDelay:0.25];
                *stop = YES;
            }
        }];
    }
}
//- (void)drawRect:(CGRect)rect{
//    [super drawRect:rect];
//    [self drawCircles];
//}
- (NSMutableArray *)layerArr{
    if (_layerArr == nil) {
        _layerArr = [[NSMutableArray alloc] init];
    }
    return _layerArr;
}
@end


