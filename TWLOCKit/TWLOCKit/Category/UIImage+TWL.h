//
//  UIImage+TWL.h
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (TWL)


/// 转换为模糊图片，默认高斯模糊半径：6.0
/// @param finishBlock finishBlock description
- (void)twl_convertToBlurImageFinish:(void(^)(UIImage *image))finishBlock;

/// 转换为模糊图片
/// @param radius 高斯模糊半径
/// @param finishBlock finishBlock description
- (void)twl_convertToBlurImageWithRadius:(float)radius finish:(void(^)(UIImage *image))finishBlock;

@end

NS_ASSUME_NONNULL_END
