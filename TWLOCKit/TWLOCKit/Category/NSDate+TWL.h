//
//  NSDate+TWL.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/28.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (TWL)

/// 当前秒级时间戳
+ (NSString *)twl_nowTimeIntervalString;

/// 当前毫秒级时间戳
+ (NSString *)twl_nowTimeIntervalMSString;


- (NSString *)twl_stringWithFormat:(NSString *)dateFormat;

@end

NS_ASSUME_NONNULL_END
