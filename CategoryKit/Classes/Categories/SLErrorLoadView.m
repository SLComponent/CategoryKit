//
//  SLErrorLoadView.m
//  PandaShop
//
//  Created by songlin on 2/2/2018.
//  Copyright © 2018 com.cn.camel. All rights reserved.
//

#import "SLErrorLoadView.h"
#import "Macro.h"
#import "UIColor+Extension.h"

@implementation SLErrorLoadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = white_color;
        [self configWifiImageV];
        [self configTipLabel];
        [self configRefreshBtn];
    }
    return self;
}

- (void)configWifiImageV {
    self.wifiImageV = [[UIImageView alloc]initWithFrame:CGRectMake((kWidth - 100)/2, 147, 100, 100)];
    self.wifiImageV.image = ImageNamed(@"wifi");
    [self addSubview:self.wifiImageV];
}


- (void)configTipLabel {
    self.showErrorLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 270, kWidth, 20)];
    _showErrorLabel.textAlignment = NSTextAlignmentCenter;
    _showErrorLabel.text = @"网络不给力";
    _showErrorLabel.textColor = kBLACK_COLOR;
    _showErrorLabel.font = H17;
    [self addSubview:self.showErrorLabel];

    self.adviceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 315, kWidth, 20)];
    _adviceLabel.textAlignment = NSTextAlignmentCenter;
    _adviceLabel.text = @"加载失败，请检查网络是否正常连接哦";
    _adviceLabel.textColor = kBLACK_COLOR;
    _adviceLabel.font = H15;
    [self addSubview:self.adviceLabel];
}

-(void)configRefreshBtn{
    self.refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.refreshBtn.frame = CGRectMake(kWidth * 0.5 - 50, 350, 100, 40);
    [self.refreshBtn setTitle:@"重新加载" forState:UIControlStateNormal];
    [self.refreshBtn setTitleColor:kBLACK_COLOR forState:UIControlStateNormal];
    self.refreshBtn.layer.borderColor = kBLACK_COLOR.CGColor;
    self.refreshBtn.layer.borderWidth = 2;
    [self.refreshBtn addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.refreshBtn];
}
- (void)refreshData{
    if (self.delegate && [self.delegate respondsToSelector:@selector(retry)]) {
        [self.delegate retry];
    }
}
@end
