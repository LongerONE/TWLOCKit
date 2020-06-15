//
//  NSMutableArray+TWL.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/30.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (TWL)


/// 安全添加值（nil 时不添加）
- (void)twl_addObject:(id _Nullable)obj;

@end

NS_ASSUME_NONNULL_END
