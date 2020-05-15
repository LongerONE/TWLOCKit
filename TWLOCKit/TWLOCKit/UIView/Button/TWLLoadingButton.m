//
//  TWLLoadingButton.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLLoadingButton.h"
#import "UIView+TWL.h"

@interface TWLLoadingButton ()

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@property (nonatomic, copy) NSString *title;

@end



@implementation TWLLoadingButton


- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _indicatorView.hidden = YES;
        _indicatorView.twl_centerX = self.twl_w * 0.5;
        _indicatorView.twl_centerY = self.twl_h * 0.5;
        [self addSubview:_indicatorView];
    }
    return _indicatorView;
}


- (void)setLoadingState:(TWLLoadingButtonState)loadingState {
    _loadingState = loadingState;
    
    if (loadingState == TWLLoadingButtonStateLoading) {
        self.title = self.titleLabel.text;
        [self setTitle:@"" forState:UIControlStateDisabled];
        self.titleLabel.hidden = YES;
        self.enabled = NO;
        self.indicatorView.hidden = NO;
        [self.indicatorView startAnimating];
    } else {
        self.titleLabel.hidden = NO;
        self.enabled = YES;
        self.indicatorView.hidden = YES;
        [self.indicatorView stopAnimating];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.indicatorView.twl_centerX = self.twl_w * 0.5;
    self.indicatorView.twl_centerY = self.twl_h * 0.5;
}

@end
