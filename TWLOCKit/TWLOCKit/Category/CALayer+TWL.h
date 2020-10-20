//
//  CALayer+TWL.h
//  RuijieOption
//
//  Created by 唐万龙 on 2020/10/10.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (TWL)

@property (nonatomic, assign) CGFloat twl_x;
@property (nonatomic, assign) CGFloat twl_y;
@property (nonatomic, assign) CGFloat twl_w;
@property (nonatomic, assign) CGFloat twl_h;


@property (nonatomic, assign) CGFloat twl_top;
@property (nonatomic, assign) CGFloat twl_left;
@property (nonatomic, assign) CGFloat twl_right;
@property (nonatomic, assign) CGFloat twl_bottom;


@end

NS_ASSUME_NONNULL_END
