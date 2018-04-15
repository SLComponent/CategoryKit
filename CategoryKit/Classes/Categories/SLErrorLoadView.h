//
//  SLErrorLoadView.h
//  PandaShop
//
//  Created by songlin on 2/2/2018.
//  Copyright © 2018 com.cn.camel. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SLErrorLoadViewDelegate<NSObject>

-(void)retry;
@end

@interface SLErrorLoadView : UIView
@property (nonatomic, weak) id<SLErrorLoadViewDelegate> delegate;

@property (nonatomic, strong) UIImageView *wifiImageV;
@property (nonatomic, strong) UILabel *showErrorLabel;
@property (nonatomic, strong) UILabel *adviceLabel;
@property (nonatomic, strong) UIButton *refreshBtn;
@end
