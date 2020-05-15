//
//  TWLGradientButton.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/6.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLGradientButton.h"

@interface TWLGradientButton ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation TWLGradientButton

- (void)setCornerRadius:(CGFloat)cornerRadius {
    [super setCornerRadius:cornerRadius];
    
    self.gradientLayer.cornerRadius = cornerRadius;
}


- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [[CAGradientLayer alloc] init];
        _gradientLayer.cornerRadius = self.cornerRadius;
        [self.layer insertSublayer:_gradientLayer atIndex:0];
    }
    return  _gradientLayer;
}


- (void)setGradientColorArray:(NSArray<UIColor *> *)gradientColorArray {
    _gradientColorArray = gradientColorArray;
    
    NSMutableArray *cgColorArray = [NSMutableArray array];
    for (UIColor *color in gradientColorArray) {
        [cgColorArray addObject:(id)color.CGColor];
    }
    self.gradientLayer.colors = cgColorArray;
}


- (void)setGradientLocationArray:(NSArray<NSNumber *> *)gradientLocationArray {
    _gradientLocationArray = gradientLocationArray;
    
    self.gradientLayer.locations = gradientLocationArray;
}

- (void)setGradientStartPoint:(CGPoint)gradientStartPoint {
    _gradientStartPoint = gradientStartPoint;
    
    self.gradientLayer.startPoint = gradientStartPoint;
}

- (void)setGradientEndPoint:(CGPoint)gradientEndPoint {
    _gradientEndPoint = gradientEndPoint;
    
    self.gradientLayer.endPoint = gradientEndPoint;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.gradientLayer.frame = self.bounds;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
