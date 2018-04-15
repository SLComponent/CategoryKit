//
//  UICollectionViewCell+Extension.m
//  PandaShop
//
//  Created by songlin on 5/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "UICollectionViewCell+Extension.h"

@implementation UICollectionViewCell (Extension)

+ (NSString *) reuseIdentifier{
    
    return NSStringFromClass([self class]);
}

+ (UINib *) nib{
    
    NSString * xibName = NSStringFromClass([self class]);
    
    return [UINib nibWithNibName:xibName bundle:[NSBundle mainBundle]];
}


+(Class)cellClass {
    return [[self class] class];
}
@end
