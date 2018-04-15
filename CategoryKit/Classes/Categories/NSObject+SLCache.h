//
//  NSObject+SLCache.h
//  PandaShop
//
//  Created by songlin on 5/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SLCache)

+ (void) setObjetArrayToCache:(NSArray*)modelList forKey:(NSString*)key;

+ (NSArray*) objectArrayFromCacheForKey:(NSString*)key;

+ (void)setObjectToCache:(id <NSCoding>)object forKey:(NSString *)key;

+ (id) objectFromCahceForKey:(NSString *)key;

+ (void)removeObjectForKey:(NSString *)key;

+ (void)removeAllObjects;

+ (NSString*) arrayCacheKey;

+ (NSString*) objectCacheKey;

- (void) saveToCacheForKey:(NSString *)key;

@end
