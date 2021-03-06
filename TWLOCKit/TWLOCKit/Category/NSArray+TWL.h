//
//  NSArray+TWL.h
//  Created by 唐万龙 on 2020/4/26.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (TWL)


/// 防越界取值（越界后返回 nil）
/// @param index index
- (id)twl_objectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
