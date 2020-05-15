//
//  TWLGradientNormalButton.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/6.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLGradientNormalButton.h"

@interface TWLGradientNormalButton ()

@property (nonatomic, strong) NSMutableArray<UIColor *> *colorsArray;

@end

@implementation TWLGradientNormalButton

//- (void)initActions {
//    [super initActions];
//    
//    
//}

- (NSMutableArray *)colorsArray {
    if (!_colorsArray) {
        _colorsArray = [NSMutableArray arrayWithCapacity:2];
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
