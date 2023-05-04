//
//  TWLGradientNormalView.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2023/5/4.
//  Copyright © 2023 唐万龙. All rights reserved.
//

#import "TWLGradientView.h"

NS_ASSUME_NONNULL_BEGIN


IB_DESIGNABLE
@interface TWLGradientNormalView : TWLGradientView

@property (nonatomic, strong) IBInspectable UIColor *gradientStartColor;

@property (nonatomic, strong) IBInspectable UIColor *gradientEndColor;

@end

NS_ASSUME_NONNULL_END
