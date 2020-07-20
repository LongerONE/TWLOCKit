//
//  TWLButton.h
//    
//
//  Created by 唐万龙 on 2020/4/23.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


IB_DESIGNABLE
@interface TWLButton : UIButton

@property (nonatomic, copy) IBInspectable NSString *identifier;

/// 一个像素的描边
@property (nonatomic, assign) IBInspectable BOOL onePixelBorder;

@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat imageCornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;


/// 标题是否有下划线
@property (nonatomic, assign) IBInspectable BOOL hasUnderLine;
@property (nonatomic, assign) IBInspectable NSInteger imageContentMode;

@property (nonatomic, strong) IBInspectable UIColor *highlightedBgColor;
@property (nonatomic, strong) IBInspectable UIColor *seletedBgColor;
@property (nonatomic, strong) IBInspectable UIColor *disableBgColor;

typedef void(^TWLButtonBlock) (TWLButton *twlBtn);

- (void)addTouchUpInsidBlock:(TWLButtonBlock)touchUpInsideBlock;



/// 初始化操作
- (void)initActions;

@end

NS_ASSUME_NONNULL_END
