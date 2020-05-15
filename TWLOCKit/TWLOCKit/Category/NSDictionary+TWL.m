//
//  NSDictionary+TWL.m
 
//
//  Created by 唐万龙 on 2020/4/24.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import "NSDictionary+TWL.h"

@implementation NSDictionary (TWL)


- (NSString *)twl_stringForKey:(NSString *)key {
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",obj];
    }
    if ([obj isEqual:[NSNull null]]) {
        return @"";
    } else if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    } else {
        return @"";
    }
}


- (NSArray *)twl_arrayForKey:(NSString *)key {
    id obj = [self objectForKey:key];
    if ([obj isEqual:[NSNull null]]) {
        return [NSArray array];
    } else if ([obj isKindOfClass:[NSArray class]]) {
        return obj;
    } else {
        return [NSArray array];
    }
}


- (NSMutableArray *)twl_mutableArrayForKey:(NSString *)key {
    id obj = [self objectForKey:key];
    if ([obj isEqual:[NSNull null]]) {
        return [NSMutableArray array];
    } else if ([obj isKindOfClass:[NSMutableArray class]]) {
        return obj;
    } else {
        return [NSMutableArray array];
    }
}


- (NSDictionary *)twl_dictionaryForKey:(NSString *)key {
    id obj = [self objectForKey:key];
    if ([obj isEqual:[NSNull null]]) {
        return [NSDictionary dictionary];
    } else if ([obj isKindOfClass:[NSDictionary class]]) {
        return obj;
    } else {
        return [NSDictionary dictionary];
    }
}




@end
