//
//  UIAlertAction+Extension.m
//  PandaShop
//
//  Created by songlin on 23/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "UIAlertAction+Extension.h"
#import <objc/runtime.h>


@implementation UIAlertAction (Extension)

static char actionID;
static char cancelID;

- (NSString *)actionID {
    return objc_getAssociatedObject(self, &actionID);
}

-(void)setActionID:(NSString *)actionID {
    objc_setAssociatedObject(self, &actionID, actionID, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)cancelID {
    return objc_getAssociatedObject(self, &cancelID);
}

-(void)setCancelID:(NSString *)cancelID {
    objc_setAssociatedObject(self, &cancelID, cancelID, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


+(instancetype)actionWithTitle:(NSString *)title
                   actionTitle:(NSString * _Nullable)actionTitle cancelTitle:(NSString * _Nullable)cancelTitle subTitle:(NSString * _Nullable)subTitle target:(UINavigationController *)target handler:(void (^ _Nullable)(UIAlertAction * _Nullable))handler
 {

     UIAlertAction *sureAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDestructive handler:handler];
     UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:handler];
     [sureAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];
     [cancelAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];

      UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:subTitle preferredStyle:UIAlertControllerStyleAlert];
      [alert addAction:sureAction];
      [alert addAction:cancelAction];
     [target presentViewController:alert animated:YES completion:nil];
     return nil;
 }
@end
