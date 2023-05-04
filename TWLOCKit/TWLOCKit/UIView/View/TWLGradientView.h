//
//  TWLGradientView.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2023/5/4.
//  Copyright © 2023 唐万龙. All rights reserved.
//

#import "TWLView.h"

NS_ASSUME_NONNULL_BEGIN


IB_DESIGNABLE
@interface TWLGradientView : TWLView


@property (nonatomic, strong) NSArray<UIColor *> *gradientColorArray;

@property (nonatomic, strong) NSArray<NSNumber *> *gradientLocationArray;

@property (nonatomic, assign) IBInspectable CGPoint gradientStartPoint;

@property (nonatomic, assign) IBInspectable CGPoint gradientEndPoint;

@end

NS_ASSUME_NONNULL_END
