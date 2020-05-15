//
//  TWLGradientButton.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/6.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLButton.h"

NS_ASSUME_NONNULL_BEGIN


IB_DESIGNABLE
@interface TWLGradientButton : TWLButton

@property (nonatomic, strong) NSArray<UIColor *> *gradientColorArray;

@property (nonatomic, strong) NSArray<NSNumber *> *gradientLocationArray;

@property (nonatomic, assign) IBInspectable CGPoint gradientStartPoint;

@property (nonatomic, assign) IBInspectable CGPoint gradientEndPoint;


@end

NS_ASSUME_NONNULL_END
