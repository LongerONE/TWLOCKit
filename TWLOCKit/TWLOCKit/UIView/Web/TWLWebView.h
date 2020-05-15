//
//  TWLWebView.h
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/29.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#import "TWLView.h"
#import "UIView+TWL.h"
#import "TWLBlocks.h"
#import "TWLConst.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^TWLWebViewJSBlock)(id _Nullable result, NSError * _Nullable error);
typedef WKNavigationActionPolicy(^TWLWebViewNavigationBlock)(WKNavigationAction *action);

IB_DESIGNABLE
@interface TWLWebView : TWLView

/// webView
@property (nonatomic, strong) WKWebView *wkWebView;

/// 链接
@property (nonatomic, copy) IBInspectable NSString *url;

/// 是否显示加载进度条
@property (nonatomic, assign) IBInspectable BOOL isShowLoadingBar;

/// 加载进度条颜色
@property (nonatomic, strong) IBInspectable UIColor *loadingBarColor;

/// 加载进度条高度
@property (nonatomic, assign) IBInspectable CGFloat loadingBarHeight;

/// 开始加载时 block
@property (nonatomic, copy, nullable) TWLVoidBlock startLoadBlock;

/// 网页加载完毕 block
@property (nonatomic, copy, nullable) TWLVoidBlock finishLoadBlock;

/// 内容高度更新回调，用于动态更新高度
@property (nonatomic, copy, nullable) TWLFloatBlock contentHeightUpdateBlock;

/// Navigation Action 回调处理
@property (nonatomic, copy, nullable) TWLWebViewNavigationBlock navigationActionBlock;

/// 注入 JS 代码
/// @param js js description
/// @param completeBlock completeBlock description
- (void)injectJS:(NSString *)js complete:(nullable TWLWebViewJSBlock)completeBlock;

/// 加载网页
- (void)loadURL;

@end

NS_ASSUME_NONNULL_END
