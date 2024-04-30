//
//  NSString+TWL.h
 
//
//  Created by 唐万龙 on 2020/4/24.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "NSDate+TWL.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TWL)

/// 生成指定长度的随机字符串
/// @param length length description
+ (NSString *)twl_randomStringWithLength:(int)length;


/// 是否为正整数
- (BOOL)twl_isPositiveInteger;


/// 是否为手机号
- (BOOL)twl_isMobilePhoneNumber;

/// 邮箱地址验证
- (BOOL)twl_isEmailAddress;

/// 身份证号码验证
- (BOOL)twl_isChineseIdCardNumer;



- (NSDate * _Nullable)twl_dateFromFormat:(NSString *)format;

- (NSDate * _Nullable)twl_toDate;



- (NSString *)twl_toUrlEncode;



- (NSString *)twl_md5;

- (NSString *)twl_sha1;

- (NSString *)twl_sha256;


/// 生成二维码
/// @param width 宽度
- (UIImage *)twl_qrcodeWithWidth:(CGFloat)width;



/// 计算文本高度
/// @param width 宽度
/// @param font 字体
- (CGFloat)twl_heightWithWidth:(CGFloat)width font:(UIFont *)font;

/// 计算文本高度
/// @param width 宽度
/// @param size 字体大小
- (CGFloat)twl_heightWithWidth:(CGFloat)width fontSize:(CGFloat)size;



/// 计算文本高度
/// @param width 宽度
/// @param size 字体大小
/// @param spacing 行距
- (CGFloat)twl_heightWithWidth:(CGFloat)width fontSize:(CGFloat)size lineSpacing:(CGFloat)spacing;


/// 计算文本宽度
/// @param height 显示高度
/// @param font 字体
- (CGFloat)twl_widthWithHeight:(CGFloat)height font:(UIFont *)font;


/// 计算文本宽度
/// @param height 显示高度
/// @param size 字体大小
- (CGFloat)twl_widthWithHeight:(CGFloat)height fontSize:(CGFloat)size;


/// 计算文本宽度
/// @param height 显示高度
/// @param size 字体大小
/// @param spacing 行距
- (CGFloat)twl_widthWithHeight:(CGFloat)height fontSize:(CGFloat)size lineSpacing:(CGFloat)spacing;


@end

NS_ASSUME_NONNULL_END
