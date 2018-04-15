//
//  UIAlertAction+Extension.h
//  PandaShop
//
//  Created by songlin on 23/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (Extension)


+ (instancetype _Nullable )actionWithTitle:(NSString *_Nullable)title
                               actionTitle:(NSString *_Nullable)actionTitle
                               cancelTitle:(NSString *_Nullable)cancelTitle
                                  subTitle:(NSString *_Nullable)subTitle
                                    target:(UINavigationController *)target
                                   handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler;
@end
