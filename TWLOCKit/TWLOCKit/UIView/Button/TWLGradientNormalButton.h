//
//  TWLGradientNormalButton.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/6.
//  Copyright © 2020 唐万龙. All rights reserved.
//



/*
 常用两种渐变色背景按钮
 */


#import "TWLGradientButton.h"

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface TWLGradientNormalButton : TWLGradientButton

@property (nonatomic, strong) IBInspectable UIColor *gradientStartColor;

@property (nonatomic, strong) IBInspectable UIColor *gradientEndColor;

@end

NS_ASSUME_NONNULL_END
