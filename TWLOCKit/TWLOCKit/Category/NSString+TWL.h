//
//  NSString+TWL.h
 
//
//  Created by 唐万龙 on 2020/4/24.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TWL)


/// 是否为正整数
- (BOOL)twl_isPositiveInteger;


/// 是否为手机号
- (BOOL)twl_isMobilePhoneNumber;


/// 生成指定长度的随机字符串
/// @param length length description
+ (NSString *)twl_randomStringWithLength:(int)length;

@end

NS_ASSUME_NONNULL_END
