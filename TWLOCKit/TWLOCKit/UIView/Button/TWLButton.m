//
//  TWLButton.m
//    
//
//  Created by 唐万龙 on 2020/4/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLButton.h"
#import "TWLConst.h"

#import "UIView+TWL.h"
#import "UIColor+TWL.h"

@interface TWLButton()

@property (nonatomic, copy) TWLButtonBlock touchUpInsideBlock;

@end

@implementation TWLButton


#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initActions];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initActions];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initActions];
    }
    return self;
}

- (void)initActions {
    
}


- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    
    self.layer.borderColor = borderColor.CGColor;
}


- (void)setOnePixelBorder:(BOOL)onePixelBorder {
    _onePixelBorder = onePixelBorder;

    self.layer.borderWidth = onePixelBorder ? TWL_ONE_PIXEL : self.borderWidth;
    self.imageView.layer.borderWidth = onePixelBorder ? TWL_ONE_PIXEL : self.borderWidth;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    
    self.layer.cornerRadius = self.cornerRadius;
}


- (void)setImageCornerRadius:(CGFloat)imageCornerRadius {
    _imageCornerRadius = imageCornerRadius;
    
    self.imageView.layer.cornerRadius = imageCornerRadius;
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

- (void)setHasUnderLine:(BOOL)hasUnderLine {
    _hasUnderLine = hasUnderLine;
    
    NSMutableAttributedString  *attString = [[ NSMutableAttributedString  alloc] initWithAttributedString:self.titleLabel.attributedText];
    NSRange range = {0, [attString length]};
    [attString addAttribute: NSUnderlineStyleAttributeName  value:[NSNumber  numberWithInteger: NSUnderlineStyleSingle] range:range];
    [self setAttributedTitle:attString forState:UIControlStateNormal];
}


- (void)setImageContentMode:(NSInteger)imageContentMode {
    _imageContentMode = imageContentMode;
    
    self.imageView.contentMode = imageContentMode;
}

- (void)setHighlightedBgColor:(UIColor *)highlightedBgColor {
    _highlightedBgColor = highlightedBgColor;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1.0, 1.0)];
    view.backgroundColor = highlightedBgColor;
    UIImage *image = [view twl_convertToImage];
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
}

- (void)setSeletedBgColor:(UIColor *)seletedBgColor {
    _seletedBgColor = seletedBgColor;
    
    [self setBackgroundImage:[seletedBgColor twl_image] forState:UIControlStateSelected];
}


#pragma mark - Block
- (void)addTouchUpInsidBlock:(TWLButtonBlock)touchUpInsideBlock {
    self.touchUpInsideBlock = touchUpInsideBlock;
    [self addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchUpInsideAction:(TWLButton *)button {
    if (self.touchUpInsideBlock) {
        self.touchUpInsideBlock(button);
    }
}


- (void)dealloc {
    NSLog(@"dealloc tag: %ld", self.tag);
}


@end
