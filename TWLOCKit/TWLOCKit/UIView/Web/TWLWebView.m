//
//  TWLWebView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/4/29.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLWebView.h"


@interface TWLWebView()<WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong) TWLView *loadingBarView;
@property (nonatomic, assign) CGFloat currentContentHeight;

@end


@implementation TWLWebView


- (WKWebView *)wkWebView {
    if (!_wkWebView) {
        WKWebViewConfiguration *conf = [[WKWebViewConfiguration alloc] init];
        _wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:conf];
        _wkWebView.UIDelegate = self;
        _wkWebView.navigationDelegate = self;
        [_wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [_wkWebView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
        [self addSubview:_wkWebView];
    }
    return _wkWebView;
}

- (TWLView *)loadingBarView {
    if (!_loadingBarView) {
        _loadingBarView = [[TWLView alloc] init];
        _loadingBarView.backgroundColor = UIColor.blueColor;
        _loadingBarView.twl_h = 3.0;
        [self addSubview:_loadingBarView];
    }
    return _loadingBarView;
}



- (void)setLoadingBarColor:(UIColor *)loadingBarColor {
    _loadingBarColor = loadingBarColor;
    
    self.loadingBarView.backgroundColor = loadingBarColor;
}

- (void)setLoadingBarHeight:(CGFloat)loadingBarHeight {
    _loadingBarHeight = loadingBarHeight;
    
    self.loadingBarView.twl_h = loadingBarHeight;
    self.loadingBarView.cornerRadius = loadingBarHeight * 0.5;
}




- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self bringSubviewToFront:self.loadingBarView];
    
    self.wkWebView.frame = self.bounds;
}



- (void)loadURL {
    if (self.url.length) {
        [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    } else if (self.filePath.length) {
        [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:self.filePath]]];
    }
}


#pragma mark - Inject js
- (void)injectJS:(NSString *)js complete:(nullable TWLWebViewJSBlock)completeBlock {
    [self.wkWebView evaluateJavaScript:js completionHandler:^(id _Nullable res, NSError * _Nullable error) {
        if (completeBlock) {
            completeBlock(res, error);
        }
    }];
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    //加载进度
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        [UIView animateWithDuration:0.3 animations:^{
            if (self.wkWebView.estimatedProgress < 1.0) {
                self.loadingBarView.twl_w = self.twl_w * self.wkWebView.estimatedProgress;
                self.loadingBarView.alpha = 1.0;
            } else {
                self.loadingBarView.twl_w = self.twl_w;
                self.loadingBarView.alpha = 0.0;
            }
        } completion:^(BOOL finished) {
            if (self.wkWebView.estimatedProgress >= 1.0) {
                self.loadingBarView.twl_w = 0.0;
            }
        }];
    }
    
    //高度更新
    if ([keyPath isEqualToString:@"contentSize"]) {
        //如果高度没变，就不回调
        if (self.currentContentHeight > 0.0 &&
            self.currentContentHeight != self.wkWebView.scrollView.contentSize.height &&
            self.contentHeightUpdateBlock) {
            self.contentHeightUpdateBlock(self.wkWebView.scrollView.contentSize.height);
        }
        
        self.currentContentHeight = self.wkWebView.scrollView.contentSize.height;
    }
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    if (self.navigationActionBlock) {
        WKNavigationActionPolicy policy = self.navigationActionBlock(navigationAction);
        decisionHandler(policy);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}





- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    TWL_SAFE_BLOCK_CALL_NO_P(self.startLoadBlock);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    TWL_SAFE_BLOCK_CALL_NO_P(self.finishLoadBlock);
}



- (void)dealloc {
    [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.wkWebView.scrollView removeObserver:self forKeyPath:@"contentSize"];
}


@end
