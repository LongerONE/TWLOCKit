//
//  TWLGradientView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2023/5/4.
//  Copyright © 2023 唐万龙. All rights reserved.
//

#import "TWLGradientView.h"


@interface TWLGradientView()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation TWLGradientView

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
    
    [self.gradientLayer removeFromSuperlayer];
    [self.layer insertSublayer:_gradientLayer atIndex:0];
    self.gradientLayer.frame = self.bounds;
}


@end
