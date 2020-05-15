//
//  NSObject+TWL.h
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TWL)


/// 对集合类型中的 NULL 进行转换
- (id)twl_changeNullType;

@end

NS_ASSUME_NONNULL_END
