//
//  NSMutableDictionary+TWL.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/29.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (TWL)


/// 插入值（对象为 nil 时，不插入）
/// @param anObject anObject description
/// @param key key description
- (void)twl_setObj:(id)anObject forKey:(id <NSCopying>)key;

@end

NS_ASSUME_NONNULL_END
