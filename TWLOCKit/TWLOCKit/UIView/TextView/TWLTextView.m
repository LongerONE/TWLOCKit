//
//  TWLTextView.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TWLTextView.h"
#import "UIView+TWL.h"

@interface TWLTextView ()

@property (nonatomic, strong) UILabel *placeholderLbl;

@property (nonatomic, strong) UILabel *countLbl;

@end

@implementation TWLTextView

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initActions];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initActions];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initActions];
    }
    return self;
}

- (void)initActions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:self];
    
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        [self textUpdated:NO];
    }
}

- (UILabel *)placeholderLbl {
    if (!_placeholderLbl) {
        _placeholderLbl = [[UILabel alloc] init];
        _placeholderLbl.font = [UIFont systemFontOfSize:14.0];
        _placeholderLbl.textColor = UIColor.lightGrayColor;
        _placeholderLbl.hidden = self.text.length > 0;
        _placeholderLbl.twl_left = self.placeholderLeft;
        _placeholderLbl.twl_top = self.placeholderTop;
        [self addSubview:_placeholderLbl];
    }
    return _placeholderLbl;
}


- (UILabel *)countLbl {
    if (!_countLbl) {
        _countLbl = [[UILabel alloc] init];
        _countLbl.textColor = UIColor.lightGrayColor;
        _countLbl.font = [UIFont systemFontOfSize:12.0];
        _countLbl.hidden = YES;
        _countLbl.text = [NSString stringWithFormat:@"%ld", self.text.length];
        [_countLbl sizeToFit];
        _countLbl.twl_bottom = self.twl_h - self.showCountBottom;
        _countLbl.twl_right = self.twl_w - self.showCountRight;
        [self addSubview:_countLbl];
    }
    return _countLbl;
}

- (void)setPlaceholderTop:(CGFloat)placeholderTop {
    _placeholderTop = placeholderTop;
    
    self.placeholderLbl.twl_top = placeholderTop;
}

- (void)setPlaceholderLeft:(CGFloat)placeholderLeft {
    _placeholderLeft = placeholderLeft;
    
    self.placeholderLbl.twl_left = placeholderLeft;
}




- (void)setPlaceholderFontSize:(CGFloat)placeholderFontSize {
    _placeholderFontSize = placeholderFontSize;
    
    self.placeholderLbl.font = [UIFont systemFontOfSize:placeholderFontSize];
    [self.placeholderLbl sizeToFit];
}


- (void)setPlaceholderFontColor:(UIColor *)placeholderFontColor {
    _placeholderFontColor = placeholderFontColor;
    
    self.placeholderLbl.textColor = placeholderFontColor;
}


- (void)setShowCountRight:(CGFloat)showCountRight {
    _showCountRight = showCountRight;
    
    self.countLbl.twl_right = self.twl_w - self.showCountRight;
}

- (void)setShowCountBottom:(CGFloat)showCountBottom {
    _showCountBottom = showCountBottom;
    
    self.countLbl.twl_bottom = self.twl_h - self.showCountBottom;
}



- (void)setShowCountFontSize:(CGFloat)showCountFontSize {
    _showCountFontSize = showCountFontSize;
    
    self.countLbl.font = [UIFont systemFontOfSize:showCountFontSize];
    [self.countLbl sizeToFit];
    self.countLbl.twl_bottom = self.twl_h - self.showCountBottom;
    self.countLbl.twl_right = self.twl_w - self.showCountRight;
}

- (void)setShowCountFontColor:(UIColor *)showCountFontColor {
    _showCountFontColor = showCountFontColor;
    
    self.countLbl.textColor = showCountFontColor;
}

- (void)setMaxLength:(int)maxLength {
    _maxLength = maxLength;
    
    //长度限制
    if (self.text.length > self.maxLength) {
        self.text = [self.text substringToIndex:self.maxLength];
    }
    
    self.countLbl.text = [NSString stringWithFormat:@"%ld/%d", self.text.length, maxLength];
    [self.countLbl sizeToFit];
    self.countLbl.twl_bottom = self.twl_h - self.showCountBottom;
    self.countLbl.twl_right = self.twl_w - self.showCountRight;
}


- (void)setShowCount:(BOOL)showCount {
    _showCount = showCount;
    
    self.countLbl.hidden = !showCount;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    
    self.placeholderLbl.text = placeholder;
    [self.placeholderLbl sizeToFit];
}

- (void)textDidChanged:(NSNotification *)noti {
    if ([noti.object isEqual:self]) {
        [self textUpdated:YES];
    }
}

- (void)textUpdated:(BOOL)isInput {
    self.placeholderLbl.hidden = self.text.length > 0;
    
    if (self.maxLength) {
        //长度限制
        if (self.text.length > self.maxLength) {
            self.text = [self.text substringToIndex:self.maxLength];
        }
        
        self.countLbl.text = [NSString stringWithFormat:@"%ld/%d", self.text.length,self.maxLength];
    } else {
        self.countLbl.text = [NSString stringWithFormat:@"%ld", self.text.length];
    }

    [self.countLbl sizeToFit];
    self.countLbl.twl_bottom = self.twl_h - self.showCountBottom;
    self.countLbl.twl_right = self.twl_w - self.showCountRight;
    
    
    if (self.updateBlock) {
        self.updateBlock(self.text, isInput);
    }
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
    [self removeObserver:self forKeyPath:@"text"];
}



@end
