//
//  TWLAlertView.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/9/22.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLView.h"
#import "TWLBlocks.h"
#import "UIView+TWL.h"
#import "TWLButton.h"
#import "TWLMacro.h"
#import "TWLConst.h"

typedef NS_ENUM(NSInteger, TWLAlertViewMaskType) {
    TWLAlertViewMaskTypeClear = 0
};

typedef NS_ENUM(NSInteger, TWLAlertViewAnimtaion) {
    TWLAlertViewAnimtaionFade = 0,
    TWLAlertViewAnimtaionZoom = 1
};

typedef NS_ENUM(NSInteger, TWLAlertViewPostion) {
    TWLAlertViewPostionCenter = 0,
    TWLAlertViewPostionBottom = 1
};

NS_ASSUME_NONNULL_BEGIN

@interface TWLAlertView : TWLView


/// 是否可点击空白处返回
@property (nonatomic, assign) BOOL canTapMaskDismiss;

/// 遮罩类型
@property (nonatomic, assign) TWLAlertViewMaskType maskType;

/// 遮罩透明度
@property (nonatomic, assign) CGFloat maskAlpha;

/// 底部位移，可用于隐藏圆角
@property (nonatomic, assign) CGFloat bottomOffset;

@property (nonatomic, copy) TWLVoidBlock cancelBlock;


- (void)showCenterWithAnimation:(TWLAlertViewAnimtaion)animation finish:(TWLVoidBlock _Nullable)finishBlock;

- (void)showBottomFinish:(TWLVoidBlock _Nullable)finishBlock;

- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
