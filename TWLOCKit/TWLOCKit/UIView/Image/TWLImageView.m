//
//  TWLImageView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLImageView.h"
#import "TWLConst.h"

@implementation TWLImageView


- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    
    self.layer.borderColor = borderColor.CGColor;
}


- (void)setOnePixelBorder:(BOOL)onePixelBorder {
    _onePixelBorder = onePixelBorder;

    self.layer.borderWidth = onePixelBorder ? TWL_ONE_PIXEL : self.borderWidth;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    
    self.layer.cornerRadius = self.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    
    if (!self.onePixelBorder) {
        self.layer.borderWidth = borderWidth;
    }
}

- (void)setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    
    self.layer.shadowColor = [shadowColor CGColor];
}


- (void)setShadowOffset:(CGSize)shadowOffset {
    _shadowOffset = shadowOffset;
    
    self.layer.shadowOffset = shadowOffset;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    _shadowRadius = shadowRadius;
    
    self.layer.shadowRadius = shadowRadius;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    CGFloat opacity = shadowOpacity > 1 ? 1 : shadowOpacity;
    _shadowOpacity = opacity;
    
    self.layer.shadowOpacity = opacity;
}
@end
