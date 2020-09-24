//
//  TWLDashView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/9/24.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLDashView.h"

@implementation TWLDashView

- (void)drawRect:(CGRect)rect {
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    int col = self.dashWidth > 0.0 ? ceil(rect.size.width / (self.dashWidth + self.blankWidth)) : 1;
    int row = self.dashHeight > 0.0 ? ceil(rect.size.height / (self.dashHeight + self.blankHeight)) : 1;
    
    for (int i = 0; i < col; i ++) {
        for (int j = 0; j < row; j++) {
            CALayer *layer = [CALayer layer];
            layer.backgroundColor = self.dashColor.CGColor;
            CGFloat x = i * (self.dashWidth + self.blankWidth);
            CGFloat y = j * (self.dashHeight + self.blankHeight);
            layer.frame = CGRectMake(x, y, self.dashWidth, self.dashHeight);
            [self.layer addSublayer:layer];
        }
    }
}
@end
