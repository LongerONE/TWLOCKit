//
//  CALayer+TWL.m
//  RuijieOption
//
//  Created by 唐万龙 on 2020/10/10.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "CALayer+TWL.h"

@implementation CALayer (TWL)


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





@end
