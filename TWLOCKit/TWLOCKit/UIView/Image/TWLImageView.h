//
//  TWLImageView.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface TWLImageView : UIImageView

@property (nonatomic, weak) id bindObj;

@property (nonatomic, copy) IBInspectable NSString *identifier;

/// 一个像素的描边
@property (nonatomic, assign) IBInspectable BOOL onePixelBorder;

// 优化内存，只显示实际大小尺寸的图片
@property (nonatomic, assign) IBInspectable BOOL optimizeMem;

@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;


@property (nonatomic, assign) IBInspectable UIImage *placeholderImg;

@property (nonatomic, copy) NSString *imgUrl;

@end

NS_ASSUME_NONNULL_END
