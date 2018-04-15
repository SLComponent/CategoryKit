//
//  UITableViewCell+Extension.m
//  PandaShop
//
//  Created by songlin on 7/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

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
