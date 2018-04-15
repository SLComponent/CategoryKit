//
//  NSObject+SLCache.m
//  PandaShop
//
//  Created by songlin on 5/11/2017.
//  Copyright © 2017 com.cn.camel. All rights reserved.
//

#import "NSObject+SLCache.h"
#import <YYCache/YYCache.h>

@implementation NSObject (SLCache)

+ (void) setObjetArrayToCache:(NSArray*)modelList forKey:(NSString*)key
{
    if (key) {
        YYCache *cache = [[YYCache alloc] initWithName:NSStringFromClass(self)];
        [cache setObject:modelList forKey:key];
    }
}

+ (NSArray*) objectArrayFromCacheForKey:(NSString*)key
{
    if (key) {
        YYCache *cache = [[YYCache alloc] initWithName:NSStringFromClass(self)];
        return (NSArray*)[cache objectForKey:key];
    }
    return nil;
}

+ (void)setObjectToCache:(id <NSCoding>)object forKey:(NSString *)key {
    if (key) {
        YYCache *cache = [[YYCache alloc] initWithName:NSStringFromClass(self)];
        [cache setObject:object forKey:key];
    }
}

+ (id) objectFromCahceForKey:(NSString *)key {
    if (key) {
        YYCache *cache = [[YYCache alloc] initWithName:NSStringFromClass(self)];
        return [cache objectForKey:key];
    }
    return nil;
}

+ (void)removeObjectForKey:(NSString *)key
{
    if (key) {
        YYCache *cache = [[YYCache alloc] initWithName:NSStringFromClass(self)];
        [cache removeObjectForKey:key];
    }
}

+ (void)removeAllObjects {
    YYCache *cache = [[YYCache alloc] initWithName:NSStringFromClass(self)];
    [cache removeAllObjects];
    
}

+ (NSString*) arrayCacheKey {
    return [NSString stringWithFormat:@"%@ArrayCacheKey",NSStringFromClass(self)];
}

+ (NSString*) objectCacheKey {
    return [NSString stringWithFormat:@"%@ObjectCacheKey",NSStringFromClass(self)];
}

- (void) saveToCacheForKey:(NSString *)key
{
    if (key && [self conformsToProtocol:@protocol(NSCoding)]) {
        YYCache *cache = [[YYCache alloc] initWithName:NSStringFromClass([self class])];
        [cache setObject:(id <NSCoding>)self forKey:key];
    }
}


@end
