//
//  NSString+TWL.h
 
//
//  Created by 唐万龙 on 2020/4/24.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TWL)

/// 生成指定长度的随机字符串
/// @param length length description
+ (NSString *)twl_randomStringWithLength:(int)length;


/// 是否为正整数
- (BOOL)twl_isPositiveInteger;


/// 是否为手机号
- (BOOL)twl_isMobilePhoneNumber;


- (NSString *)twl_md5;

- (NSString *)twl_sha1;

- (NSString *)twl_sha256;


/// 生成二维码
/// @param width 宽度
- (UIImage *)twl_qrcodeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
