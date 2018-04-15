//
//  UICollectionViewCell+Extension.h
//  PandaShop
//
//  Created by songlin on 5/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Extension)

+ (NSString *) reuseIdentifier;

+ (UINib *) nib;


+ (Class) cellClass;
@end
