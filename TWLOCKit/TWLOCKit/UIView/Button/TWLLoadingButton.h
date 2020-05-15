//
//  TWLLoadingButton.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLGradientNormalButton.h"

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, TWLLoadingButtonState) {
    TWLLoadingButtonStateNormal = 0,
    TWLLoadingButtonStateLoading = 1
};

@interface TWLLoadingButton : TWLGradientNormalButton


@property (nonatomic, assign) TWLLoadingButtonState loadingState;

@end

NS_ASSUME_NONNULL_END
