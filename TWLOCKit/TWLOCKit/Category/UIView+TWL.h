//
//  UIView+TWL.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/29.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TWL)

@property (nonatomic, assign) CGFloat twl_x;
@property (nonatomic, assign) CGFloat twl_y;
@property (nonatomic, assign) CGFloat twl_w;
@property (nonatomic, assign) CGFloat twl_h;


@property (nonatomic, assign) CGFloat twl_top;
@property (nonatomic, assign) CGFloat twl_left;
@property (nonatomic, assign) CGFloat twl_right;
@property (nonatomic, assign) CGFloat twl_bottom;

@property (nonatomic, assign) CGFloat twl_centerX;
@property (nonatomic, assign) CGFloat twl_centerY;


- (UIImage *)twl_convertToImage;

- (UIImage *)twl_convertToImageWithAlpha;


@end

NS_ASSUME_NONNULL_END
