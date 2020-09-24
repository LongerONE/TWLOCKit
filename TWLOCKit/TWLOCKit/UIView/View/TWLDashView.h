//
//  TWLDashView.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/9/24.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface TWLDashView : UIView

@property (nonatomic, assign) IBInspectable CGFloat dashWidth;
@property (nonatomic, assign) IBInspectable CGFloat dashHeight;
@property (nonatomic, assign) IBInspectable CGFloat blankWidth;
@property (nonatomic, assign) IBInspectable CGFloat blankHeight;
@property (nonatomic, strong) IBInspectable UIColor *dashColor;

@end

NS_ASSUME_NONNULL_END
