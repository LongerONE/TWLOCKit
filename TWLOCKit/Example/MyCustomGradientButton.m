//
//  MyCustomGradientButton.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "MyCustomGradientButton.h"

@implementation MyCustomGradientButton


- (void)initActions {
    [super initActions];
    
    self.gradientStartColor = [UIColor twl_colorWithHexString:@"4D2375"];
    self.gradientEndColor = [UIColor twl_colorWithHexString:@"AB66DD"];
    self.gradientStartPoint = CGPointZero;
    self.gradientEndPoint = CGPointMake(1, 0);
}

@end
