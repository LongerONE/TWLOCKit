//
//  TWLTextView.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TWLTextViewUpdateBlock)(NSString *stringResult, BOOL isInput);

IB_DESIGNABLE
@interface TWLTextView : UITextView

@property (nonatomic, copy) IBInspectable NSString *placeholder;
@property (nonatomic, assign) IBInspectable CGFloat placeholderLeft;
@property (nonatomic, assign) IBInspectable CGFloat placeholderTop;
@property (nonatomic, assign) IBInspectable CGFloat placeholderFontSize;
@property (nonatomic, strong) IBInspectable UIColor *placeholderFontColor;

@property (nonatomic, assign) IBInspectable BOOL showCount;
@property (nonatomic, assign) IBInspectable CGFloat showCountRight;
@property (nonatomic, assign) IBInspectable CGFloat showCountBottom;
@property (nonatomic, assign) IBInspectable CGFloat showCountFontSize;
@property (nonatomic, strong) IBInspectable UIColor *showCountFontColor;

@property (nonatomic, assign) IBInspectable int maxLength;


@property (nonatomic, copy) TWLTextViewUpdateBlock updateBlock;


/// 初始化操作
- (void)initActions;

@end

NS_ASSUME_NONNULL_END
