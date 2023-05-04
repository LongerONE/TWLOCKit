//
//  TWLGradientNormalView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2023/5/4.
//  Copyright © 2023 唐万龙. All rights reserved.
//

#import "TWLGradientNormalView.h"


@interface TWLGradientNormalView()

@property (nonatomic, strong) NSMutableArray<UIColor *> *colorsArray;

@end

@implementation TWLGradientNormalView


- (NSMutableArray *)colorsArray {
    if (!_colorsArray) {
        _colorsArray = [NSMutableArray arrayWithArray:@[UIColor.clearColor, UIColor.clearColor]];
        self.gradientLocationArray = @[@0.0, @1.0];
    }
    
    return _colorsArray;
}

- (void)setGradientStartColor:(UIColor *)gradientStartColor {
    _gradientStartColor = gradientStartColor;
    
    self.colorsArray[0] = gradientStartColor;
    self.gradientColorArray = self.colorsArray;
}

- (void)setGradientEndColor:(UIColor *)gradientEndColor {
    _gradientEndColor = gradientEndColor;
    
    self.colorsArray[1] = gradientEndColor;
    self.gradientColorArray = self.colorsArray;
}

@end
