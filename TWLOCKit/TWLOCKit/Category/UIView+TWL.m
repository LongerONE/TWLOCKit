//
//  UIView+TWL.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/29.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "UIView+TWL.h"

@implementation UIView (TWL)

- (CGFloat)twl_x {
    return self.frame.origin.x;
}

- (CGFloat)twl_y {
    return self.frame.origin.y;
}

- (CGFloat)twl_w {
    return self.frame.size.width;
}

- (CGFloat)twl_h {
    return self.frame.size.height;
}

- (void)setTwl_x:(CGFloat)twl_x {
    CGRect frame = self.frame;
    frame.origin.x = twl_x;
    [self setFrame:frame];
}

- (void)setTwl_y:(CGFloat)twl_y {
    CGRect frame = self.frame;
    frame.origin.y = twl_y;
    [self setFrame:frame];
}

- (void)setTwl_w:(CGFloat)twl_w {
    CGRect frame = self.frame;
    frame.size.width = twl_w;
    [self setFrame:frame];
}

- (void)setTwl_h:(CGFloat)twl_h {
    CGRect frame = self.frame;
    frame.size.height = twl_h;
    [self setFrame:frame];
}


- (CGFloat)twl_top {
    return self.twl_y;
}


- (CGFloat)twl_left {
    return self.twl_x;
}

- (CGFloat)twl_right {
    return self.twl_x + self.twl_w;
}


- (CGFloat)twl_bottom {
    return self.twl_y + self.twl_h;
}


- (void)setTwl_top:(CGFloat)twl_top {
    self.twl_y = twl_top;
}

- (void)setTwl_left:(CGFloat)twl_left {
    self.twl_x = twl_left;
}

- (void)setTwl_right:(CGFloat)twl_right {
    self.twl_x = twl_right - self.twl_w;
}

- (void)setTwl_bottom:(CGFloat)twl_bottom {
    self.twl_y = twl_bottom - self.twl_h;
}


- (CGFloat)twl_centerX {
    return self.center.x;
}

- (CGFloat)twl_centerY {
    return self.twl_centerY;
}


- (void)setTwl_centerX:(CGFloat)twl_centerX {
    CGPoint center = self.center;
    center.x = twl_centerX;
    [self setCenter:center];
}

- (void)setTwl_centerY:(CGFloat)twl_centerY {
    CGPoint center = self.center;
    center.y = twl_centerY;
    [self setCenter:center];
}



- (UIImage *)twl_convertToImage {
    //第一个参数表示区域大小 第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    CGSize size = CGSizeMake(self.layer.bounds.size.width, self.layer.bounds.size.height);
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)twl_convertToImageWithAlpha {
    CGSize size = CGSizeMake(self.layer.bounds.size.width, self.layer.bounds.size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (instancetype)loadFromNib {
    NSString *name = NSStringFromClass(self.class);
    return [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];
}

+ (instancetype)loadFromNibWithIndex:(NSInteger)index {
    NSString *name = NSStringFromClass(self.class);
    return [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] objectAtIndex:index];
}



@end
