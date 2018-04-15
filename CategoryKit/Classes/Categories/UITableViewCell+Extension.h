//
//  UITableViewCell+Extension.h
//  PandaShop
//
//  Created by songlin on 7/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

+ (NSString *) reuseIdentifier;

+ (UINib *) nib;

+ (Class) cellClass;

@end
