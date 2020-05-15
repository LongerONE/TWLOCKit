//
//  NSDictionary+TWL.h
//
//  Created by 唐万龙 on 2020/4/24.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (TWL)


/// 取字符串类型 （没有值或空或其他类型时，返回   @“”）
/// @param key key
- (NSString *)twl_stringForKey:(NSString *)key;


/// 取数组（没有值或空或其他类型时，返回空数组 @[]）
/// @param key key
- (NSArray *)twl_arrayForKey:(NSString *)key;


/// 取可变数组（没有值或空或其他类型时，返回空的可变数组）
/// @param key key
- (NSMutableArray *)twl_mutableArrayForKey:(NSString *)key;


/// 取字典类型（没有值或空或其他类型时，返回空的可变数组）
/// @param key key
- (NSDictionary *)twl_dictionaryForKey:(NSString *)key;




@end

NS_ASSUME_NONNULL_END
