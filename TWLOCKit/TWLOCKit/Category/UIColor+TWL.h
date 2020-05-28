//
//  UIColor+TWL.h
 
//
//  Created by 唐万龙 on 2020/4/26.
//  Copyright © 2020 TangWanlong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TWL)

+ (UIColor *)twl_colorWithHexString:(NSString *)hexString;

+ (UIColor *)twl_colorWithHexString: (NSString *)color alpha:(CGFloat)alpha;


/// 转换当前颜色到 Hex
- (NSString *)twl_hexString;

/// 生成 1 像素图片，可用于背景色填充等场景
- (UIImage *)twl_image;

@end

NS_ASSUME_NONNULL_END
